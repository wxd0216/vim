#!/bin/bash
## by orientlu

echo "---------->>> Other sh running"
ls | grep -v "run.sh"| while read line
do
    sh $line
done

