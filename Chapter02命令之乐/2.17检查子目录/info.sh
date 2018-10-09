#!/bin/bash

for d in `find $1 -type d`;
do
    echo `find $d -type f | wc -l` files in $d;
done
