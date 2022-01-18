#!/usr/bin/env bash

ROOTDIR="data"

BATCHSIZE="64"
DATASET="celebA"
EPOCHS="50"
SAMPLERATE="0.0001" # DP ERM
CLIPNORM="0.1"


mkdir -p ./logs/${DATASET}

#############################
# gDRO + NoiseSGD
#############################
MODEL="resnet50"
for LR in 1e-3
do
  for SIGMA in 0.001 0.01 0.1 #1.0
  do
    python examples/run_expt.py \
      --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
      --optimizer SGD --sigma ${SIGMA} --apply_noise \
      --weight_decay 0. --lr ${LR} \
      --log_dir ./logs/${DATASET}/groupDRO-${MODEL}-lr${LR}-noisesgd_${SIGMA} \
      --algorithm groupDRO --download
    for SP in 1 # 2
    do
      python examples/run_expt.py \
        --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
        --optimizer SGD --sigma ${SIGMA} --apply_noise \
        --weight_decay 0. --lr ${LR} \
        --log_dir ./logs/${DATASET}/groupDRO-${MODEL}-lr${LR}-noisesgd_${SIGMA}_SP${SP} \
        --algorithm groupDRO --download
    done
  done
done

