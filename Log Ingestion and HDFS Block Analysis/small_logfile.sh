#!/bin/bash

echo "Starting HDFS Task for Large Log File..."

# Create HDFS directory if not exists
hdfs dfs -mkdir -p /logs

# Upload large log file to HDFS
hdfs dfs -put -f logfiles.log /logs

echo "File uploaded to HDFS."

# List file in HDFS
hdfs dfs -ls /logs

echo "Running block analysis..."

# Check block information
hdfs fsck /logs/logfiles.log -files -blocks

echo "Task Completed Successfully."
