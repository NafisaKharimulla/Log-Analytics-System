#!/bin/bash

echo "Setting Hadoop Environment..."

export HADOOP_HOME=/mnt/d/hadoop
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin

echo "HADOOP_HOME = $HADOOP_HOME"
echo "Environment Setup Completed."
