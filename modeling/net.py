import torch
import torch.nn as nn
import torch.nn.functional as F
from modeling.networks.backbone import build_feature_extractor, NET_OUT_DIM
from models import CoordAtt


class HolisticHead(nn.Module):
    def __init__(self, in_dim, dropout=0):
        super(HolisticHead, self).__init__()
        self.attn = CoordAtt(in_dim, in_dim)
        self.conv = nn.Sequential(nn.Conv2d(in_dim, in_dim, 3, padding=1),
                                  nn.BatchNorm2d(in_dim),
                                  nn.ReLU())
        self.conv1 = nn.Conv2d(in_dim, in_dim, kernel_size=3, padding=1, dilation=1)
        self.conv2 = nn.Conv2d(in_dim, in_dim, kernel_size=3, padding=2, dilation=2)
        self.conv3 = nn.Conv2d(in_dim, in_dim, kernel_size=3, padding=5, dilation=5)
        self.fc1 = nn.Linear(in_dim, 256)
        self.fc2 = nn.Linear(256, 1)
        self.drop = nn.Dropout(dropout)

    def forward(self, x):
        x_dilated1 = self.conv1(x)
        x_dilated2 = self.conv2(x)
        x_dilated3 = self.conv3(x)
        x_All_dilated = x_dilated1 + x_dilated2 + x_dilated3
        x_conv = self.conv(x)
        x_att = self.attn(x)
        x =  x_conv * x_att
        x = x_All_dilated + x
        x = self.conv(x)
        x = F.adaptive_avg_pool2d(x, (1, 1))
        x = x.view(x.size(0), -1)
        x = self.drop(F.relu(self.fc1(x)))
        x = self.fc2(x)
        return torch.abs(x)


class PlainHead(nn.Module):
    def __init__(self, in_dim, topk_rate=0.1): 
        super(PlainHead, self).__init__()
        self.scoring = nn.Conv2d(in_channels=in_dim, out_channels=1, kernel_size=1, padding=0)
        self.topk_rate = topk_rate

    def forward(self, x):
        x = self.scoring(x)
        x = x.view(int(x.size(0)), -1) 
        topk = max(int(x.size(1) * self.topk_rate), 1)
        x = torch.topk(torch.abs(x), topk, dim=1)[0]
        x = torch.mean(x, dim=1).view(-1, 1)
        return x


class CompositeHead(PlainHead):
    def __init__(self, in_dim, topk=0.1):
        super(CompositeHead, self).__init__(in_dim, topk)
        self.conv = nn.Sequential(nn.Conv2d(in_dim, in_dim, 3, padding=1),
                                  nn.BatchNorm2d(in_dim),
                                  nn.ReLU())

    def forward(self, x, ref):
        ref = torch.mean(ref, dim=0).repeat([x.size(0), 1, 1, 1]) # 將 ref 的數量擴充到跟 Normal 相同
        x = ref - x
        x = self.conv(x)
        x = super().forward(x)
        return x


class DRA(nn.Module):
    def __init__(self, cfg, backbone="resnet18"):
        super(DRA, self).__init__()
        self.cfg = cfg
        self.feature_extractor = build_feature_extractor(backbone, cfg)
        self.in_c = NET_OUT_DIM[backbone]
        self.holistic_head = HolisticHead(self.in_c) # 整體
        self.seen_head = PlainHead(self.in_c, self.cfg.topk) #簡單
        self.pseudo_head = PlainHead(self.in_c, self.cfg.topk) #簡單
        self.composite_head = CompositeHead(self.in_c, self.cfg.topk) #合成

    def forward(self, image, label):
        image_pyramid = list() #金字塔不同 scale的size
        for i in range(self.cfg.total_heads):
            image_pyramid.append(list())
        for s in range(self.cfg.n_scales):
            image_scaled = F.interpolate(image, size=self.cfg.img_size // (2 ** s)) if s > 0 else image
            # print("下採樣",image_scaled.shape) # image_scaled.shape = [53, 3, 448, 448]
            feature = self.feature_extractor(image_scaled)
            # print("Feature map大小",feature.shape) # feature.shape = [53, 512, 14, 14])
            ref_feature = feature[:self.cfg.nRef, :, :, :]
            feature = feature[self.cfg.nRef:, :, :, :]

            if self.training:
                normal_scores = self.holistic_head(feature)
                abnormal_scores = self.seen_head(feature[label != 2])
                dummy_scores = self.pseudo_head(feature[label != 1])
                comparison_scores = self.composite_head(feature, ref_feature)
            else:
                normal_scores = self.holistic_head(feature)
                abnormal_scores = self.seen_head(feature)
                dummy_scores = self.pseudo_head(feature)
                comparison_scores = self.composite_head(feature, ref_feature)
            for i, scores in enumerate([normal_scores, abnormal_scores, dummy_scores, comparison_scores]):
                image_pyramid[i].append(scores)
        for i in range(self.cfg.total_heads):
            image_pyramid[i] = torch.cat(image_pyramid[i], dim=1)
            image_pyramid[i] = torch.mean(image_pyramid[i], dim=1)
        return image_pyramid


