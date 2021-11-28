#!/usr/bin/env bash

ROOTDIR="data"
MODEL="vgg11"
EPOCHS="50"
BATCHSIZE="32"

DATASET="celebA"

mkdir -p ./logs/${DATASET}

python examples/run_expt.py \
  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
  --log_dir ./logs/${DATASET}/erm \
  --algorithm ERM

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/erm_reweight \
#  --algorithm ERM --uniform_over_groups

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/groupDRO \
#  --algorithm groupDRO
