#!/bin/bash

mkdir /workspace/training_logs
mkdir /workspace/testing_logs
mkdir /workspace/test_scores

cd /workspace/Hidden-Two-Stream/models/ucf101_split1_nosup_end/

touch trainlist02.txt trainlist03.txt testlist02.txt testlist03.txt

cd /workspace/Hidden-Two-Stream/

start=90
end=90
for((i=start; i<=end; i++))
do
    echo "Training with $i examples per class"
    python /workspace/Hidden-Two-Stream/models/ucf101_split1_unsup_end/build_train_val_list_files.py $i /workspace/Hidden-Two-Stream/models/ucf101_split1_unsup_end /mnt/out /workspace/Hidden-Two-Stream/models/ucf101_split1_unsup_end
bash /workspace/Hidden-Two-Stream/scripts/build_file_list.sh ucf101 /mnt/out

#    echo "Begin Training with $i example per class"
#    bash /app/scripts/train_tsn.sh ucf101 flow 2>&1 | tee /app/training_logs/train_log_$i.txt


#    echo "Begin Testing with Test set"
#    rm /app/data/ucf101_splits/ucf101_flow_val_split_1.txt
#    cp test_set.txt ucf101_flow_val_split_1.txt
#    python eval_net.py ucf101 1 flow /mnt/out \
#    models/ucf101/tsn_bn_inception_flow_deploy.prototxt models/ucf101_split1_tsn_flow_bn_inception_iter_2000.caffemodel \
#    --num_worker 1 --save_scores /app/test_scores/score_test_$i > /app/testing_logs/test_log_$i.txt
done
