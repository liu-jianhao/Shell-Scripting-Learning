#!/bin/bash
data="name,gender,rollno,location"
echo data: $data

oldIFS=$IFS
IFS=,
for Item in $data
do
    echo Item: $Item
done

IFS=$oldIFS
