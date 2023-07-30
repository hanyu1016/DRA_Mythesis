call C:\Users\MVCLAB\Anaconda3\Scripts\activate.bat C:\Users\MVCLAB\Anaconda3\envs\DRA_plus
cd C:\Users\MVCLAB\Desktop\DRA
python train.py --dataset_root=./data/VisA_20230626 --classname=capsules --nAnomaly=5 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20230626 --classname=candle --nAnomaly=5 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20230626 --classname=cashew --nAnomaly=5 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20230626 --classname=chewinggum --nAnomaly=5 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20230626 --classname=fryum --nAnomaly=5 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20230626 --classname=macaroni1 --nAnomaly=5 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20230626 --classname=macaroni2 --nAnomaly=5 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20230626 --classname=pcb1 --nAnomaly=5 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20230626 --classname=pcb2 --nAnomaly=5 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20230626 --classname=pcb3 --nAnomaly=5 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20230626 --classname=pcb4 --nAnomaly=5 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20230626 --classname=pipe_fryum --nAnomaly=5 >>DRA_VisA_experiment.txt
@pause 