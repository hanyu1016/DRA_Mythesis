import torch
from modeling.layers.deviation_loss import DeviationLoss
from modeling.layers.binary_focal_loss import BinaryFocalLoss

def build_criterion(criterion ,classname):
    if criterion == "deviation":
        print("class name :",classname)
        print("Loss : Deviation")
        return DeviationLoss()
    elif criterion == "BCE":
        print("Loss : Binary Cross Entropy")
        return torch.nn.BCEWithLogitsLoss()
    elif criterion == "focal":
        print("Loss : Focal")
        return BinaryFocalLoss()
    elif criterion == "CE":
        print("Loss : CE")
        return torch.nn.CrossEntropyLoss()
    else:
        raise NotImplementedError