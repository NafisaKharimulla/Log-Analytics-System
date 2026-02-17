#!/bin/bash

# Phase 7: Hadoop Configuration and Performance Tuning
# Task 8: Configuration Analysis

# Problem:
# Cluster performance degrades when log volume increases.
# Configuration tuning is required for better performance.


# HDFS Configuration (hdfs-site.xml)

# dfs.blocksize
# Default: 128MB
# Recommendation: Increase to 256MB for large log files.
# Impact:
# Fewer blocks are created.
# Reduced metadata load on NameNode.
# Improved read throughput for large files.

# dfs.replication
# Default: 3
# Recommendation: Keep at 3 (reduce to 2 only in test environments).
# Impact:
# Lower replication reduces storage and network overhead.
# Higher replication improves fault tolerance but increases write cost.

# dfs.namenode.handler.count
# Increase value for high concurrent requests.
# Impact:
# Improves NameNode responsiveness.
# Reduces client waiting time.


# MapReduce Configuration (mapred-site.xml)

# mapreduce.map.memory.mb
# mapreduce.reduce.memory.mb
# Increase memory if tasks spill to disk.
# Impact:
# Reduces disk spill.
# Improves task execution speed.
# Prevents container failure due to memory limits.

# mapreduce.task.io.sort.mb
# Increase from default (100MB).
# Impact:
# Reduces intermediate spill to disk.
# Improves shuffle performance.

# mapreduce.job.reduces
# Tune reducer count based on input data size.
# Impact:
# Too few reducers create bottleneck.
# Too many reducers increase overhead.


# YARN Configuration (yarn-site.xml)

# yarn.nodemanager.resource.memory-mb
# Increase according to node capacity.
# Impact:
# Allows more containers to run in parallel.
# Improves cluster utilization.

# yarn.scheduler.maximum-allocation-mb
# Increase to support memory-intensive jobs.
# Impact:
# Enables larger containers.

# yarn.nodemanager.resource.cpu-vcores
# Adjust according to available CPU cores.
# Impact:
# Prevents CPU over-allocation.
# Improves parallel processing.


# Recommended Changes

# Increase HDFS block size for large logs.
# Tune Map and Reduce memory allocation.
# Increase YARN container memory based on hardware.
# Optimize reducer count.
# Increase NameNode handler threads.


# Overall Impact

# Reduced disk I/O.
# Better memory utilization.
# Faster job execution.
# Improved scalability.
# Higher cluster stability under heavy load.
