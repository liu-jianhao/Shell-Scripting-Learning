#!/bin/bash

if [ $# -ne 1 ];
then
    echo "Usage is $0 basepath";
    exit
fi
path=$1

# 关联数组
# 文件类型作为索引
# 值为该类型的文件数量
declare -A statarray;

while read line;
do
    ftype=`file -b "$line" | cut -d, -f1`
    let statarray["$ftype"]++;

# done <<< "`find $path -type f -print`"
# 第一个 < 用于输入重定向，第二个 < 用于将子进程的输出转换成文件名
done < <(find $path -type f -print)

echo ============= File tpes and counts ===========
# ${!statarray[@]} 用于返回数组的索引列表
for ftype in "${!statarray[@]}";
do
    echo $ftype : ${statarray["$ftype"]}
done
