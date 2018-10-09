#!/bin/bash
sort -C file.txt ;
if [ $? -eq 0 ]; then
    echo Sorted;
else
    echo Unsorted;
fi
