#!/bin/bash

echo "Starting Task 4: Built-in WordCount Execution..."

# Variables
INPUT_PATH=/logs/logfiles.log        # Change if using large file
OUTPUT_PATH=/logs/output_wordcount

# Remove previous output if exists
hdfs dfs -rm -r -f $OUTPUT_PATH

# Run Hadoop WordCount job
echo "Running Hadoop WordCount..."
hadoop jar /mnt/d/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.6.jar wordcount $INPUT_PATH $OUTPUT_PATH

# List output in HDFS
echo "Listing WordCount output files in HDFS..."
hdfs dfs -ls $OUTPUT_PATH

# Display first few lines of WordCount result
echo "Displaying top lines of WordCount output..."
hdfs dfs -cat $OUTPUT_PATH/part-r-00000 | head

echo "Task 4 Completed Successfully."
