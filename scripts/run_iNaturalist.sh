#!/usr/bin/env bash

ROOTDIR="data"

MODEL="resnet18"
BATCHSIZE="256"
DATASET="inaturalist"
EPOCHS="20"

mkdir -p ./logs/${DATASET}

LR="1e-3"
#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/erm-${MODEL}-lr${LR} \
#  --algorithm ERM --weight_decay 0. --download

python examples/run_expt.py \
  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
  --log_dir ./logs/${DATASET}/iwerm-${MODEL}-lr${LR} \
  --algorithm IWERM --weight_decay 0. --download
