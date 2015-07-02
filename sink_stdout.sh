#!/bin/bash

# Example of a extreamly simple sink.
# Bash snipt take from i0rek.
# https://github.com/armon/statsite/blob/master/sinks/cloudwatch.sh

OIFS=$IFS
while read line
do
  # line format: key|val|timestamp\n
  if [[ -z $line ]]; then continue; fi

  # splitting it at |
  IFS='|'
  arr=($line); key=${arr[0]}; value=${arr[1]}; timestamp=${arr[2]}
  
  echo "Key: $key, Value: $value, Timestamp: $timestamp"
done
IFS=$OIFS

exit 0
