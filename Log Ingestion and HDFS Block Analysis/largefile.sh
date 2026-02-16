#!/bin/bash

echo "Starting Task 3: Large Log File Scalability Test..."

# Move to current directory (optional)
cd /mnt/d/hadoop

# Step 1: Generate sample log line
echo '76.103.128.42 - - [07/Apr/2017:00:00:00 +0530] "PUT /usr/admin HTTP/1.0" 404 4864 "http://www.parker-miller.org/tag/list/list/privacy/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4380.0 Safari/537.36 Edg/89.0.759.0" 4927' > sample_line.log

# Step 2: Generate 1GB large log file
echo "Generating 1GB large log file..."
yes "$(cat sample_line.log)" | head -c 1G > large_logfile.log
echo "1GB log file created: $(ls -lh large_logfile.log | awk '{print $5}')"

# Step 3: Create HDFS directory
hdfs dfs -mkdir -p /large_logs

# Step 4: Upload file to HDFS
echo "Uploading file to HDFS..."
hdfs dfs -put -f large_logfile.log /large_logs
echo "File uploaded successfully."

# Step 5: List files in HDFS
hdfs dfs -ls /large_logs

# Step 6: Check HDFS blocks
echo "Running HDFS block analysis..."
hdfs fsck /large_logs/large_logfile.log -files -blocks

echo "Task 3 Completed Successfully."
