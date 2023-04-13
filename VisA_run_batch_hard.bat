call C:\Users\MVCLAB\Anaconda3\Scripts\activate.bat C:\Users\MVCLAB\Anaconda3\envs\DRA_plus
cd C:\Users\MVCLAB\Desktop\DRA
python train.py --dataset_root=./data/VisA_20220922 --classname=chewinggum --nAnomaly=1 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20220922 --classname=macaroni2 --nAnomaly=1 >>DRA_VisA_experiment.txt
python train.py --dataset_root=./data/VisA_20220922 --classname=pcb2 --nAnomaly=1 >>DRA_VisA_experiment.txt
@pause 