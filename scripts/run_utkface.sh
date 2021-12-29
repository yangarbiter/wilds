#!/usr/bin/env bash

ROOTDIR="data"

MODEL="resnet50"
BATCHSIZE="64"
DATASET="utkface"
EPOCHS="100"


mkdir -p ./logs/${DATASET}

#############################
# IWERM + NoiseSGD
#############################
#MODEL="resnet50"
#for LR in 1e-3
#do
#  for SIGMA in 0.01 1.0
#  do
#    python examples/run_expt.py \
#      --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#      --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --apply_noise \
#      --weight_decay 0. --lr ${LR} \
#      --log_dir ./logs/${DATASET}/iwerm-${MODEL}-lr${LR}-noisesgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#      --algorithm IWERM --download
#  done
#done

#############################
# ERM + DPSGD
#############################
#MODEL="dp_resnet50"
#SAMPLERATE=0.001
#for LR in 1e-3
#do
#  for CLIPNORM in 1.0
#  do
#    for SIGMA in 0.0001 10.0
#    do
#      python examples/run_expt.py \
#        --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#        --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#        --uniform_iid --sample_rate $SAMPLERATE --weight_decay 0. --lr ${LR} \
#        --log_dir ./logs/${DATASET}/erm-${MODEL}-lr${LR}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#        --algorithm ERM --download
#    done
#  done
#done

#############################
# DPSGD IW
#############################
MODEL="dp_resnet50"
SAMPLERATE=0.001
#for CLIPNORM in 0.1 10.0
#do
#  for SIGMA in 0.001 0.01 0.1 1.0
#  do
#    PYTHONPATH=. python examples/run_expt.py \
#      --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#      --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#      --weighted_uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. \
#      --log_dir ./logs/${DATASET}/weightederm-${MODEL}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#      --algorithm ERM --download
#  done
#done
#
for LR in 1e-3
do
  for CLIPNORM in 10.0 1.0
  do
    for SIGMA in 0.000001 0.00001 0.0001
    do
      PYTHONPATH=. python examples/run_expt.py \
        --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
        --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
        --weighted_uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. --lr ${LR} \
        --log_dir ./logs/${DATASET}/weightederm-${MODEL}-lr${LR}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
        --algorithm ERM --download
    done
  done
done

#for LR in 1e-2 1e-4
#do
#  for CLIPNORM in 1.0
#  do
#    for SIGMA in 0.001 0.01 0.1 1.0
#    do
#      PYTHONPATH=. python examples/run_expt.py \
#        --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#        --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#        --weighted_uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. --lr ${LR} \
#        --log_dir ./logs/${DATASET}/weightederm-${MODEL}-lr${LR}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#        --algorithm ERM --download
#    done
#  done
#done

#MODEL="dp_resnet50"
##SAMPLERATE=0.001
#SAMPLERATE=0.002
#for LR in 1e-3
#do
#  for CLIPWEIGHT in 0.001 0.002
#  do
#    for CLIPNORM in 1.0
#    do
#      for SIGMA in 0.01 0.1 1.0
#      do
#        PYTHONPATH=. python examples/run_expt.py \
#          --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#          --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#          --weighted_uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. --lr ${LR} \
#          --clip_sample_rate $CLIPWEIGHT \
#          --log_dir ./logs/${DATASET}/weightederm-cw${CLIPWEIGHT}-${MODEL}-lr${LR}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#          --algorithm ERM --download
#      done
#    done
#  done
#done

#
#for CLIPNORM in 0.1 10.0
#do
#  for SIGMA in 0.001 0.01 0.1 1.0
#  do
#    PYTHONPATH=. python examples/run_expt.py \
#      --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#      --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#      --weighted_uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. \
#      --log_dir ./logs/${DATASET}/weightederm-${MODEL}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#      --algorithm ERM --download
#  done
#done
#
#for LR in 1e-2 1e-4
#do
#  for CLIPNORM in 1.0
#  do
#    for SIGMA in 0.001 0.01 0.1 1.0
#    do
#      PYTHONPATH=. python examples/run_expt.py \
#        --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#        --optimizer SGD --delta 1e-5 --sigma ${SIGMA} --max_per_sample_grad_norm $CLIPNORM --enable_privacy \
#        --weighted_uniform_iid --sample_rate ${SAMPLERATE} --weight_decay 0. --lr ${LR} \
#        --log_dir ./logs/${DATASET}/weightederm-${MODEL}-lr${LR}-dpsgd_1e-5_${SIGMA}_${CLIPNORM}_${SAMPLERATE} \
#        --algorithm ERM --download
#    done
#  done
#done

#############################
# ERM IW
#############################
#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/erm_reweight-${MODEL} \
#  --algorithm ERM --uniform_over_groups --weight_decay 0. --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/erm_reweight-${MODEL}_wd0.1 \
#  --algorithm ERM --uniform_over_groups --weight_decay 0.1 --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/erm_reweight-${MODEL}_wd0.01 \
#  --algorithm ERM --uniform_over_groups --weight_decay 0.01 --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/erm_reweight-${MODEL}_wd0.001 \
#  --algorithm ERM --uniform_over_groups --weight_decay 0.001 --download

#############################
# groupDRO
#############################
#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/groupDRO-${MODEL} \
#  --algorithm groupDRO --weight_decay 0. --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/groupDRO-${MODEL}_wd0.1 \
#  --algorithm groupDRO --weight_decay 0.1 --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/groupDRO-${MODEL}_wd0.01 \
#  --algorithm groupDRO --weight_decay 0.01 --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/groupDRO-${MODEL}_wd0.001 \
#  --algorithm groupDRO --weight_decay 0.001 --download

#python examples/run_expt.py \
#  --dataset $DATASET --model $MODEL --n_epochs $EPOCHS --batch_size $BATCHSIZE --root_dir $ROOTDIR \
#  --log_dir ./logs/${DATASET}/groupDRO-${MODEL}_wd1.0 \
#  --algorithm groupDRO --weight_decay 1.0 --download
