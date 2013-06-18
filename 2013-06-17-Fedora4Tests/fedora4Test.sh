#!/bin/bash

LOOPS=10

BASE="/opt/ff-jmeter-madness"
export PATH="$PATH:${BASE}/jmeter/bin"

# Threads
#for x in 1 5 10 20 40 80; do
for x in 1; do
  THREADS=$x

  # File sizes
  for y in 1 1024 8192 104858 1048576 8388608 107374182; do
    FILE_SIZE=$y
    STD_DEV=$(($FILE_SIZE / 10))

    echo "threads=$THREADS, loops=$LOOPS, file-size=$FILE_SIZE, stddev=$STD_DEV"
    CMD="$BASE/jmeter/bin/jmeter -n -t ${BASE}/plans/fedora.jmx -Jfedora_4_context='fcrepo/rest' -Jnum_threads=${THREADS} -Jloop_count=${LOOPS} -Jfilesize_mean=${FILE_SIZE} -Jfilesize_stddev=${STD_DEV} -Jfixtures=/opt/ff-jmeter-madness/fixtures"

    echo "cmd: $CMD"
    /bin/bash -c "$CMD"

    # Stop tomcat
    sudo service tomcat7 stop
    sleep 30

    # Clean-up
    sudo rm -rf /opt/fcrepo4-data/active-mq
    sudo rm -rf /opt/fcrepo4-data/ispn
    sudo rm -rf /opt/fcrepo4-data/ispn-alt
    sudo rm -rf /opt/fcrepo4-data/ispn-binary
    sudo rm -rf /opt/fcrepo4-data/mode
    sudo rm -rf /opt/fcrepo4-data/object-store
    sudo rm -rf /opt/fcrepo4-data/object-store-default
    sudo rm -rf /var/lib/tomcat7/target
    sleep 30

    # Start tomcat
    sudo service tomcat7 start

  done
done

