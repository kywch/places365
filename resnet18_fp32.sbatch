#!/bin/bash
#SBATCH --job-name=train_resnet18_fp32
#SBATCH --output=train_resnet18_fp32.sbatch_out
#SBATCH --error=train_resnet18_fp32.sbatch_err
#SBATCH --time=35:00:00
#SBATCH --nodes=1
#SBATCH --partition=gpu2
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=32000

module load cuda/9.0
module load Anaconda3/5.0.1
source activate fastai

python train2.py data --save-dir xlog_180502_resnet18_fp32 -a resnet18 -b 128 --sz 256

cp checkpoint.pth.tar xlog_180502_resnet18_fp32

mv resnet18_fp32.sbatch xlog_180502_resnet18_fp32
mv train_resnet18_fp32.sbatch_out xlog_180502_resnet18_fp32
mv train_resnet18_fp32.sbatch_err xlog_180502_resnet18_fp32

