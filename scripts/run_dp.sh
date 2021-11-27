#!/usr/bin/env bash

ROOTDIR="data"
MODEL="vgg11"
EPOCHS="50"
BATCHSIZE="8"

DATASET="celebA"

mkdir -p ./logs/${DATASET}

python examples/run_expt.py \
  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
  --optimizer DPSGD --delta 1e-5 --sigma 1.0 --max_per_sample_grad_norm 1.0 \
  --uniform_iid --sample_rate 0.001 \
  --log_dir ./logs/${DATASET}/erm-dpsgd_1e-5_1.0_1.0_0.001 \
  --algorithm ERM --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --optimizer DPSGD --delta 1e-5 --sigma 2.0 --max_per_sample_grad_norm 1.0 \
#  --uniform_iid --sample_rate 0.001 \
#  --log_dir ./logs/${DATASET}/erm-dpsgd_1e-5_2.0_1.0_0.001 \
#  --algorithm ERM
