#!/bin/bash
cd /workspace/Hidden-Two-Stream/models/ucf101_split1_unsup_end
touch trainlist02.txt trainlist03.txt testlist02.txt testlist03.txt

i=60

echo "Training with $i examples per class"
python /workspace/Hidden-Two-Stream/models/ucf101_split1_unsup_end/build_train_val_list_files.py $i /workspace/Hidden-Two-Stream/models/ucf101_split1_unsup_end /mnt/out /workspace/Hidden-Two-Stream/models/ucf101_split1_unsup_end

bash /workspace/Hidden-Two-Stream/scripts/build_file_list.sh ucf101 /mnt/out
#bash /workspace/Hidden-Two-Stream/fix.sh
#sleep 5s
#ls /workspace/Hidden-Two-Stream/models/ucf101_split1_unsup_end 

