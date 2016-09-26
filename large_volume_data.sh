#!/bin/bash

PROCESS_NUM=$1
METRIC_NUM_FOR_ONE_PROCESS=$2

# Send Data to METRIC
SCRIPT_PATH="/Users/yunx/Documents/PROJECTS/graphite/bin"
for i in `seq 1 $PROCESS_NUM`
do
	MIN_METRIC=$(( ($i - 1) * $METRIC_NUM_FOR_ONE_PROCESS + 1 ))
	MAX_METRIC=$(( $i * $METRIC_NUM_FOR_ONE_PROCESS ))
	$SCRIPT_PATH/test_feeding.sh $MIN_METRIC $MAX_METRIC &
done