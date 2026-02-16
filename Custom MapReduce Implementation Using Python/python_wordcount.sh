#!/bin/bash

# Script: python_wordcount.sh
# Purpose: Automate Python WordCount on Hadoop Streaming (YARN)

echo "=== Starting Python WordCount Task on HDFS ==="

# HDFS paths
INPUT_FILE=/logs/logfiles.log
OUTPUT_DIR=/logs/output_python_wordcount

# Delete old output if exists
echo "Deleting old output directory (if any)..."
hdfs dfs -rm -r $OUTPUT_DIR

# Submit Hadoop Streaming job
echo "Submitting Hadoop Streaming job on YARN..."
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.3.6.jar \
-files mapper.py,reducer.py \
-input $INPUT_FILE \
-output $OUTPUT_DIR \
-mapper mapper.py \
-reducer reducer.py

# Check if job finished successfully
if [ $? -eq 0 ]; then
    echo "Hadoop Streaming job completed successfully!"
    echo " Listing HDFS output files "
    hdfs dfs -ls $OUTPUT_DIR

    echo " Showing first 20 lines of result "
    hdfs dfs -cat $OUTPUT_DIR/part-* | head -n 20
else
    echo "Hadoop Streaming job FAILED. Check logs for details."
fi

echo " Python WordCount Task Finished "
