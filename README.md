# Log Analytics System for a Growing Enterprise

## Project Overview

This project demonstrates the design, configuration, and evaluation of a Hadoop-based batch processing system for analyzing large-scale web access logs.

The objective is to evaluate Hadoop’s scalability, fault tolerance, and performance characteristics before adopting it in production.



## Business Context

The organization manages multiple internal web applications and administrative systems. Every interaction generates structured web access logs in the format:

<IP> - - [timestamp] "HTTP_METHOD URI PROTOCOL" STATUS_CODE RESPONSE_SIZE "REFERRER" "USER_AGENT" EXTRA_FIELD

As log volume increases daily, a distributed processing framework is required to efficiently store and analyze large datasets.

Dataset Source:
https://www.kaggle.com/datasets/avinhok/website-log-access



## Technologies Used

- Apache Hadoop (HDFS, YARN, MapReduce)
- Hadoop Streaming
- Python (Mapper & Reducer)
- Shell Scripting
- Pseudo-Distributed Hadoop Setup

---

## Project Phases

### Phase 1: Hadoop Environment Setup
- Configured single-node pseudo-distributed Hadoop cluster
- Enabled HDFS and YARN
- Verified Hadoop daemons
- Validated Web UIs
- Confirmed HDFS read/write operations

### Phase 2: Log Ingestion & HDFS Block Analysis
- Uploaded small log file to HDFS
- Analyzed block creation behavior
- Generated large log file (1GB+)
- Verified block splitting with 128MB block size
- Studied impact of block size on parallelism and fault tolerance

### Phase 3: Built-in MapReduce Execution
- Executed Hadoop built-in WordCount
- Analyzed number of mapper tasks
- Studied relationship between input blocks and mappers
- Observed shuffle and reducer behavior

### Phase 4: Python MapReduce Using Hadoop Streaming
- Implemented WordCount using Python
- Executed via Hadoop Streaming
- Compared performance with built-in MapReduce
- Evaluated flexibility and execution overhead

### Phase 5: Error-Focused Log Analysis
- Filtered logs with HTTP status >= 400
- Calculated:
  - Frequency of error status codes
  - Frequency of error-generating endpoints
- Analyzed performance benefits of early filtering

### Phase 6: Hadoop Architecture Evolution Study
Compared:
- Hadoop 1.X (JobTracker & TaskTracker)
- Hadoop 2.X (Introduction of YARN)
- Hadoop 3.X (High availability & scalability improvements)

Studied:
- ResourceManager and NodeManager roles
- Architectural limitations and improvements

### Phase 7: Configuration & Performance Tuning
Analyzed:
- HDFS block management properties
- MapReduce memory configurations
- YARN resource allocation settings





##  Key Concepts Demonstrated

- HDFS block allocation behavior
- Relationship between block size and parallelism
- Distributed MapReduce execution
- YARN resource management
- Python Hadoop Streaming integration
- Performance optimization through configuration tuning
- Early filtering to reduce shuffle overhead



##  How to Execute

### Upload file to HDFS
hdfs dfs -put sample_logs.log /logs/

### Run Built-in WordCount
hadoop jar hadoop-mapreduce-examples-*.jar wordcount /logs/sample_logs.log /logs/output_wordcount

### Run Python Streaming Job
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-input /logs/sample_logs.log \
-output /logs/output_python \
-mapper mapper.py \
-reducer reducer.py



##  Outcomes

- Validated Hadoop distributed processing capability
- Demonstrated scalability with large log datasets
- Implemented custom analytics using Python Streaming
- Optimized configuration for better performance
- Analyzed architectural evolution of Hadoop ecosystem



##  Author

Nafisa Shaik  
Hadoop Log Analytics System  


