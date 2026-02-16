#!/bin/bash


echo " Running Hadoop WordCount Job "

# Load environment
source ./setup.sh

INPUT_DIR=/wordcount_input
OUTPUT_DIR=/wordcount_output
LOCAL_FILE=/mnt/d/sample.txt

echo ""
echo "Creating HDFS input directory..."
hdfs dfs -mkdir -p $INPUT_DIR

echo ""
echo "Uploading file to HDFS..."
hdfs dfs -put -f $LOCAL_FILE $INPUT_DIR

echo ""
echo "Removing old output directory (if exists)..."
hdfs dfs -rm -r -f $OUTPUT_DIR 2>/dev/null

echo ""
echo "Running WordCount job..."
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.6.jar wordcount $INPUT_DIR $OUTPUT_DIR

echo ""
echo "Displaying Output:"
hdfs dfs -cat $OUTPUT_DIR/part-r-00000


echo "WordCount Job Completed Successfully!"

