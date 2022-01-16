#!/usr/bin/env bash

ROOTDIR="data"

BATCHSIZE="8"
DATASET="celebA"
EPOCHS="50"
SAMPLERATE="0.0001" # DP ERM
CLIPNORM="0.1"


mkdir -p ./logs/${DATASET}

#############################
# IWERM + NoiseSGD
#############################
#MODEL="resnet50"
#for LR in 1e-3
#do
#  for SIGMA in 0.001 0.01 0.1 # 1.0
#  do
#    python examples/run_expt.py \
#      --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#      --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --apply_noise \
#      --weight_decay 0. --lr ${LR} --split_scheme 1 \
#      --log_dir ./logs/${DATASET}/iwerm-${MODEL}-lr${LR}-noisesgd_1e-5_${SIGMA}_sp1 \
#      --algorithm IWERM --download
#    #python examples/run_expt.py \
#    #  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#    #  --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --apply_noise \
#    #  --weight_decay 0. --lr ${LR} \
#    #  --log_dir ./logs/${DATASET}/iwerm-${MODEL}-lr${LR}-noisesgd_1e-5_${SIGMA} \
#    #  --algorithm IWERM --download
#  done
#done

#############################
# ERM
#############################
#BATCHSIZE="64"
#MODEL="resnet50"
#for wd in 1.0 0.1 0.01
#do
#  for SP in 1 2
#  do
#    python examples/run_expt.py \
#      --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#      --split_scheme $SP \
#      --log_dir ./logs/${DATASET}/erm-${MODEL}_wd${wd}_sp${SP} \
#      --algorithm ERM --weight_decay ${wd} --download
#  done
#  #python examples/run_expt.py \
#  #  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  #  --log_dir ./logs/${DATASET}/erm-${MODEL}_wd${wd} \
#  #  --algorithm ERM --weight_decay ${wd} --download
#done

#############################
# IWERM
#############################
BATCHSIZE="64"
MODEL="resnet50"
for SP in 1 2
do
  python examples/run_expt.py \
    --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
    --split_scheme $SP \
    --log_dir ./logs/${DATASET}/iwerm-${MODEL}_sp${SP} \
    --algorithm IWERM --weight_decay 0. --download
  for wd in 0.001 0.01 #1.0 0.1
  do
    python examples/run_expt.py \
      --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
      --split_scheme $SP \
      --log_dir ./logs/${DATASET}/iwerm-${MODEL}_wd${wd}_sp${SP} \
      --algorithm IWERM --weight_decay ${wd} --download
  done
done


#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/iwerm-${MODEL} \
#  --algorithm IWERM --weight_decay 0. --download
#for wd in 0.001 0.01 #1.0 0.1
#do
#  python examples/run_expt.py \
#    --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#    --log_dir ./logs/${DATASET}/iwerm-${MODEL}_wd${wd} \
#    --algorithm IWERM --weight_decay ${wd} --download
#done


#############################
# weighted + DPSGD
#############################
#MODEL="dp_resnet50"
#for CLIPNORM in 1.0
#do
#  for SIGMA in 0.0001 10.0
#  do
#    PYTHONPATH=. python examples/run_expt.py \
#      --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#      --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#      --weighted_uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. \
#      --log_dir ./logs/${DATASET}/weightederm-${MODEL}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#      --algorithm ERM
#  done
#done

#############################
# ERM + DPSGD
#############################
#LR="1e-3"
#SAMPLERATE="0.0001"
#for CLIPNORM in 1.0
#do
#  for SIGMA in 0.0001 0.001 0.01 0.1 1.0 10.0
#  do
#    python examples/run_expt.py \
#      --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#      --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#      --uniform_iid --sample_rate $SAMPLERATE --weight_decay 0. --lr ${LR} \
#      --log_dir ./logs/${DATASET}/erm-${MODEL}-lr${LR}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#      --algorithm ERM --download
#  done
#done

#############################
# DRO + DPSGD
#############################
#for SIGMA in 0.001 0.01 0.1 1.0
#do
#  python examples/run_expt.py \
#    --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#    --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#    --uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. \
#    --log_dir ./logs/${DATASET}/groupdro-${MODEL}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#    --algorithm groupDRO --download
#done

# IWERM + DPSGD
#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#  --uniform_iid --sample_rate $SAMPLERATE --weight_decay 0. \
#  --log_dir ./logs/${DATASET}/iwerm-${MODEL}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#  --algorithm IWERM --download

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
