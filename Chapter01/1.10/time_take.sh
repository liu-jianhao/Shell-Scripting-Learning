#!/bin/bash
start=$(date +%s)
# commands;
sleep 1
# statements;
end=$(date +%s)
difference=$(( end - start ))
echo Time taken to excute commands is $difference seconds.
