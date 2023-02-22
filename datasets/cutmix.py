import random
import math
from torchvision import transforms
import torch
import cv2
import numpy as np
from PIL import Image


class CutMix(object):
    def __init__(self, colorJitter=0.1, area_ratio=[0.02, 0.15], aspect_ratio=0.3, **kwags):
        super(CutMix, self).__init__(**kwags)
        if colorJitter is None:
            self.colorJitter = None
        else:
            self.colorJitter = transforms.ColorJitter(brightness=colorJitter,
                                                      contrast=colorJitter,
                                                      saturation=colorJitter,
                                                      hue=colorJitter)
        self.area_ratio = area_ratio
        self.aspect_ratio = aspect_ratio
        self.rotation = [-45, 45]

    def __call__(self, img):
        img2array_RGB =  cv2.cvtColor(np.asarray(img),cv2.COLOR_RGB2BGR)
        img2array =cv2.cvtColor(np.asarray(img),cv2.COLOR_RGB2GRAY)

        ret,thresh1 = cv2.threshold(img2array,125,225,cv2.THRESH_BINARY_INV)
        kernel = np.ones((3,3), np.uint8) 
        dilation_img = cv2.dilate(thresh1, kernel, iterations = 1)
        gray_lap = cv2.Laplacian(dilation_img, cv2.CV_16S, ksize=3)
        dst = cv2.convertScaleAbs(gray_lap) # 轉回uint8

        contours, hierarchy = cv2.findContours(dst, cv2.RETR_EXTERNAL,cv2.CHAIN_APPROX_SIMPLE)
        mx = (0,0,0,0)      # biggest bounding box so far
        mx_area = 0
        for cont in contours:
            x,y,w,h = cv2.boundingRect(cont)
            area = w*h
            if area > mx_area:
                mx = x,y,w,h
                mx_area = area
        x,y,w,h = mx
        cv2.rectangle(img2array_RGB, (x, y), (x+w, y+h), (0, 0, 225), 0)

        image_cropped = img2array_RGB[y+1:y+h,x+1:x+w]
        image_cropped = Image.fromarray(image_cropped)
        h, w = image_cropped.size

        if h > w :
            w = h
        else :
            h = w
        
        if h <300 and w <300  :
            h = w = 380


        h = img.size[0]
        w = img.size[1]

        ratio_area = random.uniform(self.area_ratio[0], self.area_ratio[1]) * w * h
        log_ratio = torch.log(torch.tensor((self.aspect_ratio, 1 / self.aspect_ratio)))
        aspect = torch.exp(
            torch.empty(1).uniform_(log_ratio[0], log_ratio[1])
        ).item()

        cut_w = int(round(math.sqrt(ratio_area * aspect)))
        cut_h = int(round(math.sqrt(ratio_area / aspect)))

        from_location_h = int(random.uniform(0, h - cut_h))
        from_location_w = int(random.uniform(0, w - cut_w))

        box = [from_location_w, from_location_h, from_location_w + cut_w, from_location_h + cut_h]
        patch = img.crop(box) # In this crop image

        if self.colorJitter:
            patch = self.colorJitter(patch)

        to_location_h = int(random.uniform(0, h - cut_h))
        to_location_w = int(random.uniform(0, w - cut_w))

        insert_box = [to_location_w, to_location_h, to_location_w + cut_w, to_location_h + cut_h]
        augmented = img.copy()
        augmented.paste(patch, insert_box) # Let patch paste in augmented with location insert_box
        return augmented