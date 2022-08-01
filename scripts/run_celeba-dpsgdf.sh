#!/usr/bin/env bash

ROOTDIR="data"

BATCHSIZE="64"
DATASET="celebA"
EPOCHS="50"
SAMPLERATE="0.0001" # DP ERM
CLIPNORM="0.1"


mkdir -p ./logs/${DATASET}

#############################
# ERM + DPSGDf
#############################
MODEL="dp_resnet50"
LR="1e-3"
SAMPLERATE="0.0001"
for CLIPNORM in 0.1
do
  for SIGMA in 10.0 # 0.0001 0.001 0.01 0.1 1.0 10.0
  do
    SIGMA2=$(echo "$SIGMA 10.0" | awk '{print $1 * $2}')
    echo $SIGMA2
    python examples/run_expt.py \
      --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
      --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_fair_privacy \
      --uniform_iid --sample_rate $SAMPLERATE --weight_decay 0. --lr ${LR} \
      --C0 ${CLIPNORM} --sigma2 ${SIGMA2}\
      --log_dir ./logs/${DATASET}/dpsgdferm-${MODEL}-lr${LR}-dpsgdf_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
      --algorithm ERMDPSGDf --download
  done
done
