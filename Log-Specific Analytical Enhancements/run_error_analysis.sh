#!/bin/bash

HADOOP_STREAMING_JAR=$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar
INPUT_PATH=/logs/logfiles.log
OUTPUT_PATH=/logs/output_error_analysis

echo "Starting Error-Focused Log Analysis..."

# Remove old output
hdfs dfs -rm -r -f $OUTPUT_PATH

echo "Running Hadoop Streaming job..."

hadoop jar $HADOOP_STREAMING_JAR \
    -files error_mapper.py,error_reducer.py \
    -input $INPUT_PATH \
    -output $OUTPUT_PATH \
    -mapper "python3 error_mapper.py" \
    -reducer "python3 error_reducer.py"

if [ $? -eq 0 ]; then
    echo "Job completed successfully."
    hdfs dfs -cat $OUTPUT_PATH/part-00000
else
    echo "Job failed."
fi


# Analysis
# 1. Justification of Mapper and Reducer Design Decisions (5 Lines)

# The mapper performs early filtering to process only error logs (status ≥ 400).
# It emits STATUS_code and ENDPOINT_path as keys for structured aggregation.
# This reduces unnecessary data transfer during shuffle.
# The reducer simply sums values to calculate error frequency.
# This design is efficient, scalable, and suitable for large log datasets.

# 2. Impact of Filtering on Job Performance (5 Lines)

# Filtering removes non-error records at the mapper stage.
# This reduces intermediate data sent to reducers.
# Lower shuffle volume decreases network overhead.
# Reducers process fewer records, improving execution speed.
# Overall, filtering enhances performance and resource efficiency.