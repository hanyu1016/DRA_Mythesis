call C:\Users\MVCLAB\Anaconda3\Scripts\activate.bat C:\Users\MVCLAB\Anaconda3\envs\DRA
cd C:\Users\MVCLAB\Desktop\DRA
python train.py --dataset_root=./data/VisA_20220922 --classname=capsules --experiment_dir=./experiment --nAnomaly=1 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20220922 --classname=candle --experiment_dir=./experiment --nAnomaly=1 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20220922 --classname=cashew --experiment_dir=./experiment --nAnomaly=1 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20220922 --classname=chewinggum --experiment_dir=./experiment --nAnomaly=1 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20220922 --classname=fryum --experiment_dir=./experiment --nAnomaly=1 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20220922 --classname=macaroni1 --experiment_dir=./experiment --nAnomaly=1 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20220922 --classname=macaroni2 --experiment_dir=./experiment --nAnomaly=1 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20220922 --classname=pcb1 --experiment_dir=./experiment --nAnomaly=1 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20220922 --classname=pcb2 --experiment_dir=./experiment --nAnomaly=1 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20220922 --classname=pcb3 --experiment_dir=./experiment --nAnomaly=1 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20220922 --classname=pcb4 --experiment_dir=./experiment --nAnomaly=1 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20220922 --classname=pipe_fryum --experiment_dir=./experiment --nAnomaly=1 >>DRA_VisA_experiment.txt
@pause 