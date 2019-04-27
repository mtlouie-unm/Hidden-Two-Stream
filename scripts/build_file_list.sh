#!/usr/bin/env bash

DATASET=$1
FRAME_PATH=$2

#python /workspace/Hidden-Two-Stream/tools/build_file_list.py ${DATASET} ${FRAME_PATH} img_ flow_x flow_y 3 /workspace/Hidden-Two-Stream/models/ucf101_split1_unsup_end/ --shuffle

python /workspace/Hidden-Two-Stream/tools/build_file_list.py ${DATASET} ${FRAME_PATH} --shuffle
