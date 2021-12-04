#!/usr/bin/env bash

ROOTDIR="data"
MODEL="dp_resnet18"
BATCHSIZE="8"
DATASET="celebA"
EPOCHS="50"
SAMPLERATE="0.00025"

MODEL="dp_resnet50"
BATCHSIZE="32"
DATASET="waterbirds"
EPOCHS="300"
SAMPLERATE="0.001"

mkdir -p ./logs/${DATASET}

# ERM + DPSGD
#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --optimizer DPSGD --delta 1e-5 --sigma 1.0 --max_per_sample_grad_norm 1.0 \
#  --uniform_iid --sample_rate $SAMPLERATE --weight_decay 0. \
#  --log_dir ./logs/${DATASET}/erm-${MODEL}-dpsgd_1e-5_1.0_1.0_${SAMPLERATE} \
#  --algorithm ERM --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --optimizer DPSGD --delta 1e-5 --sigma 2.0 --max_per_sample_grad_norm 1.0 \
#  --uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. \
#  --log_dir ./logs/${DATASET}/erm-${MODEL}-dpsgd_1e-5_2.0_1.0_${SAMPLERATE} \
#  --algorithm ERM

# weighted + DPSGD
python examples/run_expt.py \
  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
  --optimizer DPSGD --delta 1e-5 --sigma 1.0 --max_per_sample_grad_norm 1.0 \
  --weighted_uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. \
  --log_dir ./logs/${DATASET}/weightederm-${MODEL}-dpsgd_1e-5_1.0_1.0_${SAMPLERATE} \
  --algorithm ERM

# DRO + DPSGD
#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --optimizer DPSGD --delta 1e-5 --sigma 1.0 --max_per_sample_grad_norm 1.0 \
#  --uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. \
#  --log_dir ./logs/${DATASET}/groupdro-${MODEL}-dpsgd_1e-5_1.0_1.0_${SAMPLERATE} \
#  --algorithm groupDRO --download
