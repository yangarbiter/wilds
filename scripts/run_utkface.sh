#!/usr/bin/env bash

ROOTDIR="data"

MODEL="resnet50"
BATCHSIZE="64"
DATASET="utkface"
EPOCHS="100"


mkdir -p ./logs/${DATASET}

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/erm-${MODEL} \
#  --algorithm ERM --weight_decay 0. --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/erm_reweight-${MODEL} \
#  --algorithm ERM --uniform_over_groups --weight_decay 0. --download

python examples/run_expt.py \
  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
  --log_dir ./logs/${DATASET}/erm_reweight-${MODEL}_wd0.1 \
  --algorithm ERM --uniform_over_groups --weight_decay 0.1 --download

python examples/run_expt.py \
  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
  --log_dir ./logs/${DATASET}/erm_reweight-${MODEL}_wd0.01 \
  --algorithm ERM --uniform_over_groups --weight_decay 0.01 --download

python examples/run_expt.py \
  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
  --log_dir ./logs/${DATASET}/erm_reweight-${MODEL}_wd0.001 \
  --algorithm ERM --uniform_over_groups --weight_decay 0.001 --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/groupDRO-${MODEL} \
#  --algorithm groupDRO --weight_decay 0. --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/groupDRO-${MODEL}_wd0.1 \
#  --algorithm groupDRO --weight_decay 0.1 --download

python examples/run_expt.py \
  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
  --log_dir ./logs/${DATASET}/groupDRO-${MODEL}_wd0.01 \
  --algorithm groupDRO --weight_decay 0.01 --download

python examples/run_expt.py \
  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
  --log_dir ./logs/${DATASET}/groupDRO-${MODEL}_wd0.001 \
  --algorithm groupDRO --weight_decay 0.001 --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/groupDRO-${MODEL}_wd1.0 \
#  --algorithm groupDRO --weight_decay 1.0 --download
