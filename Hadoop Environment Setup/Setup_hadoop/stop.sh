#!/bin/bash


echo " Stopping Hadoop Cluster "


echo ""
echo "Stopping YARN..."
./sbin/stop-yarn.sh

echo ""
echo "Stopping HDFS..."
./sbin/stop-dfs.sh

echo ""
echo "Checking Remaining Processes..."
jps

echo ""
echo "Hadoop Cluster Stopped Successfully!"

