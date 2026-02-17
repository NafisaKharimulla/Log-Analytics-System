#!/bin/bash

# Phase 6: Hadoop Architecture Evolution Study
# Task 7: Architecture Comparison

# Hadoop 1.X
# Architecture:
# - Master-Slave model.
# - JobTracker (Master) and TaskTracker (Slave).

# Key Components:
# - JobTracker: Handles job scheduling and resource allocation.
# - TaskTracker: Executes Map and Reduce tasks.
# - NameNode and DataNode for HDFS storage.

# Limitations:
# - Single point of failure (JobTracker).
# - Limited scalability.
# - Supports only MapReduce processing.
# - Resource management tightly coupled with job scheduling.


# Hadoop 2.X
# Major Evolution:
# - Introduction of YARN (Yet Another Resource Negotiator).

# Key Components:
# - ResourceManager: Global resource manager.
# - NodeManager: Manages resources on each node.
# - ApplicationMaster: Manages lifecycle of applications.

# Improvements:
# - Eliminates JobTracker bottleneck.
# - Supports multiple processing frameworks (MapReduce, Spark, etc.).
# - Better scalability.
# - Improved fault tolerance.


# Hadoop 3.X

# Built on YARN with further enhancements.

# Key Improvements:
# - Enhanced high availability.
# - Erasure Coding for storage efficiency.
# - Improved container management.
# - Higher scalability and better performance.


# Architecture Evolution Summary

# Hadoop 1.X -> JobTracker based, limited scalability.
# Hadoop 2.X -> YARN introduced, improved resource management.
# Hadoop 3.X -> High availability, better storage efficiency, high scalability.

