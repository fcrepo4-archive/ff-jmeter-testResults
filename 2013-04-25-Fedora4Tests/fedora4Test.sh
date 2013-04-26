#!/bin/bash
declare -A STD_DEVIATIONS=(
  [1]=0.1
  [1024]=102
  [8192]=819
  [104858]=10486
  [1048576]=104858
  [8388608]=838861
  [107374182]=10737418
)
#THREAD_COUNTS=(1 5 10 20 40 80 160 320);
THREAD_COUNTS=(1 5 10 20 40 80);
MEAN_VALUES=(1 1024 8192 104858 1048576 8388608 107374182);
for MEAN in "${MEAN_VALUES[@]}";
do
  std_dev=${STD_DEVIATIONS[$MEAN]};
  for THREAD_COUNT in "${THREAD_COUNTS[@]}";
  do 
    echo "Working on $MEAN - $std_dev - $THREAD_COUNT";
    jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_4_server=futures6 -Jfedora_4_context=fcrepo/rest -Jfilesize_mean=$MEAN -Jfilesize_stddev=$std_dev -Jnum_threads=$THREAD_COUNT -Jloop_count=10
  done
done
