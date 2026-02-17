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


#Comparison

#The built-in WordCount job is executed directly from the terminal using Hadoop’s pre-built example JAR, without writing any additional code.
#The Python WordCount uses custom mapper and reducer scripts executed through Hadoop Streaming.
#The built-in job runs fully inside Hadoop’s framework, making it faster and more performance-efficient.
#The Python version runs external Python processes, which adds execution overhead due to data streaming and process creation.
#Overall, the built-in method is simpler and faster, while the Python approach provides greater flexibility and customization.