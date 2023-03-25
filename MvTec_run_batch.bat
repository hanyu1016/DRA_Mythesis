call C:\Users\MVCLAB\Anaconda3\Scripts\activate.bat C:\Users\MVCLAB\Anaconda3\envs\DRA_plus
cd C:\Users\MVCLAB\Desktop\DRA
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=bottle --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=cable --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=capsule --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=carpet --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=grid --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=hazelnut --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=leather --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=metal_nut --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=pill --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=screw --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=tile --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=toothbrush --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=transistor --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=wood --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
python train.py --dataset_root=./data/mvtec_anomaly_detection --classname=zipper --experiment_dir=./experiment --nAnomaly=1 >>DRA_experiments.txt
@pause 
:: bottle cable capsule carpet grid hazelnut leather metal_nut pill screw tile toothbrush transistor wood zipper 
:: Total 15 class 