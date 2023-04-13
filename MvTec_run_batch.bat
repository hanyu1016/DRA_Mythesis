call C:\Users\MVCLAB\Anaconda3\Scripts\activate.bat C:\Users\MVCLAB\Anaconda3\envs\DRA_plus
cd C:\Users\MVCLAB\Desktop\DRA
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=carpet  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=grid  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=leather  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=tile  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=wood  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=bottle  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=capsule  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=pill  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=transistor  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=zipper  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=cable  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=hazelnut  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=metal_nut  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=screw  --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=toothbrush  --nAnomaly=1 >>DRA_experiments.txt
@pause 
:: bottle cable capsule carpet grid hazelnut leather metal_nut pill screw tile toothbrush transistor wood zipper 
:: Total 15 class 