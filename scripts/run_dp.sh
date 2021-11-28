#!/usr/bin/env bash

ROOTDIR="data"
MODEL="dp_resnet18"
EPOCHS="50"
BATCHSIZE="8"

DATASET="celebA"

mkdir -p ./logs/${DATASET}

# ERM + DPSGD
#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --optimizer DPSGD --delta 1e-5 --sigma 1.0 --max_per_sample_grad_norm 1.0 \
#  --uniform_iid --sample_rate 0.00025 \
#  --log_dir ./logs/${DATASET}/erm-dpsgd_1e-5_1.0_1.0_0.00025 \
#  --algorithm ERM --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --optimizer DPSGD --delta 1e-5 --sigma 2.0 --max_per_sample_grad_norm 1.0 \
#  --uniform_iid --sample_rate 0.00025 \
#  --log_dir ./logs/${DATASET}/erm-dpsgd_1e-5_2.0_1.0_0.00025 \
#  --algorithm ERM

# weighted + DPSGD
python examples/run_expt.py \
  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
  --optimizer DPSGD --delta 1e-5 --sigma 1.0 --max_per_sample_grad_norm 1.0 \
  --weighted_uniform_iid --sample_rate 0.00025 \
  --log_dir ./logs/${DATASET}/weightederm-dpsgd_1e-5_1.0_1.0_0.00025 \
  --algorithm ERM

# DRO + DPSGD
#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --optimizer DPSGD --delta 1e-5 --sigma 1.0 --max_per_sample_grad_norm 1.0 \
#  --uniform_iid --sample_rate 0.00025 \
#  --log_dir ./logs/${DATASET}/groupdro-dpsgd_1e-5_1.0_1.0_0.00025 \
#  --algorithm groupDRO --download
