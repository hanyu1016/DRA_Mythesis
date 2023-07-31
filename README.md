# Multi-Stage Data Augmentation and Dilated Coordinate Attention Neural Network
By Han-yu Chuang, Kai-Lung Hua

## Prerequisites 
This code is written in `Python 3.8` and requires the packages listed in `requirements.txt`. Install with `pip install -r
requirements.txt` preferably in a virtualenv.

## Run

#### Step 1. Setup the Anomaly Detection Dataset
Download the Anomaly Detection Dataset and convert it to [**VisA**](https://amazon-visual-anomaly.s3.us-west-2.amazonaws.com/VisA_20220922.tar) format. 
The dataset folder structure should look like:
```
DATA_PATH/
    subset_1/
        train/
            good/
        test/
            good/
            defect_class_1/
            defect_class_2/
            defect_class_3/
            ...
    ...
```
and when you built concda virtual environment successfully, you can execute batch file that be named "VisA_generate_setting". Or you can process a command line like Step 2.
#### Step 2. Running DRA
```bash
python train.py --dataset_root=./data/VisA_20230626 \
                --classname=carpet \
                --experiment_dir=./experiment
                >>DRA_VisA_experiment.txt  
```
- `dataset_root` denotes the path of the dataset.
- `classname` denotes the subset name of the dataset.
- `experiment_dir` denotes the path to store the experiment setting and model weight.
- `outlier_root` (*optional) given the path of the outlier dataset to disable pseudo augmentation and enable external data for pseudo head.
- `know_class` (*optional) specify the anomaly class in the training set to experiment within the hard setting.


## Perlin noise process path
```
.\datasets\synthetic_anomaly_process.py
```
You can according object characteristic adjsut threshold.

### Simulate Perlin Appearance
[Genarate Perlin](https://colab.research.google.com/drive/10q1qxyebCBVF6FJhdC_lWnKraJ_AcPd1?usp=drive_link) 
## CutMix process path
```
.\datasets\cutmix.py
```
Same as Perlin noise. I write a comment message in code.
## Git
[Link](https://github.com/hanyu1016/DRA_Mythesis/tree/v0.1-perlin)
## Our baseline
 ["Catching Both Gray and Black Swans: Open-set Supervised Anomaly Detection"](https://arxiv.org/abs/2203.14506).
## Conference
Under Review 
 
