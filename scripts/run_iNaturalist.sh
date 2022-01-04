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
#  --algorithm ERM --weight_decay 0. --lr ${LR} --download

#############################
# IWERM
#############################
#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/iwerm-${MODEL}-lr${LR} \
#  --algorithm IWERM --weight_decay 0. --lr ${LR} --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/iwerm-${MODEL}-lr${LR}_wd1.0 \
#  --algorithm IWERM --weight_decay 1.0 --lr ${LR} --download

python examples/run_expt.py \
  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
  --log_dir ./logs/${DATASET}/iwerm-${MODEL}-lr${LR}_wd0.01 \
  --algorithm IWERM --weight_decay 0.01 --lr ${LR} --download

#############################
# gDRO
#############################
#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/groupDRO-${MODEL}-lr${LR} \
#  --algorithm groupDRO --weight_decay 0. --lr ${LR} --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/groupDRO-${MODEL}-lr${LR}_wd0.1 \
#  --algorithm groupDRO --weight_decay 0.1 --lr ${LR} --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/groupDRO-${MODEL}-lr${LR}_wd1.0 \
#  --algorithm groupDRO --weight_decay 1.0 --lr ${LR} --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/groupDRO-${MODEL}-lr${LR}_wd0.001 \
#  --algorithm groupDRO --weight_decay 0.001 --lr ${LR} --download

#############################
# weighted + DPSGD
#############################
#MODEL="dp_resnet18"
#SAMPLERATE=0.0001
#LR="1e-3"
#BATCHSIZE="64"
#for CLIPNORM in 100.0
#do
#  for SIGMA in 0.00000001
#  do
#    PYTHONPATH=. python examples/run_expt.py \
#      --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#      --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#      --weighted_uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. --lr ${LR} \
#      --log_dir ./logs/${DATASET}/weightederm-${MODEL}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#      --algorithm ERM --download
#  done
#done

#############################
# IWERM + NoiseSGD
#############################
#MODEL="resnet18"
#for LR in 1e-3
#do
#  for SIGMA in 1.0 # 0.1 0.01
#  do
#    python examples/run_expt.py \
#      --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#      --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --apply_noise \
#      --weight_decay 0. --lr ${LR} \
#      --log_dir ./logs/${DATASET}/iwerm-${MODEL}-lr${LR}-noisesgd_1e-5_${SIGMA} \
#      --algorithm IWERM --download
#  done
#done
