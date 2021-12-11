#!/usr/bin/env bash

ROOTDIR="data"

MODEL="dp_resnet18"
BATCHSIZE="8"
DATASET="celebA"
EPOCHS="50"
SAMPLERATE="0.0001" # DP ERM
#SAMPLERATE="0.00005" #
#SAMPLERATE="0.005" # subsample
SIGMA="1.0"
CLIPNORM="1.0"

#MODEL="dp_resnet50"
#BATCHSIZE="32"
#DATASET="waterbirds"
#EPOCHS="300"
#SAMPLERATE="0.002"
#SIGMA="0.5"
#CLIPNORM="1.0"

#MODEL="dp_bert-base-uncased"
#BATCHSIZE="16"
#DATASET="civilcomments"
#EPOCHS="5"
#SAMPLERATE="0.0002"
#SIGMA="0.01"
#CLIPNORM="10.0"

mkdir -p ./logs/${DATASET}

# ERM + DPSGD
#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#  --uniform_iid --sample_rate $SAMPLERATE --weight_decay 0. \
#  --log_dir ./logs/${DATASET}/erm-${MODEL}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#  --algorithm ERM --download

# IWERM + DPSGD
python examples/run_expt.py \
  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
  --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
  --uniform_iid --sample_rate $SAMPLERATE --weight_decay 0. \
  --log_dir ./logs/${DATASET}/erm-${MODEL}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
  --algorithm IWERM --download

# weighted + DPSGD
#PYTHONPATH=. python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#  --weighted_uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. \
#  --log_dir ./logs/${DATASET}/weightederm-${MODEL}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#  --algorithm ERM

## subsample + DPSGD
#PYTHONPATH=. python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm 1.0 --enable_privacy \
#  --uniform_iid  --sample_rate $SAMPLERATE --weight_decay 0. \
#  --log_dir ./logs/${DATASET}/subsamplederm-${MODEL}-dpsgd_1e-5_${SIGMA}_1.0_${SAMPLERATE} \
#  --algorithm ERM --subsample

# DRO + DPSGD
#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#  --uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. \
#  --log_dir ./logs/${DATASET}/groupdro-${MODEL}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#  --algorithm groupDRO --download
