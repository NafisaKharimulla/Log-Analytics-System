#!/bin/bash


echo " Starting Hadoop Cluster "


# Load environment
source ./setup.sh

echo ""
echo "Starting HDFS..."
./sbin/start-dfs.sh

echo ""
echo "Starting YARN..."
./sbin/start-yarn.sh

echo ""
echo "Checking Running Hadoop Daemons..."
jps

echo ""
echo "Hadoop Cluster Started Successfully!"
