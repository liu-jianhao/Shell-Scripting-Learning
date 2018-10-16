# 使用grep

## 使用正则表达式
```shell
$ grep -E "[a-z+] filename
```
若没有`-E`则表示使用基础的正则表达式，是扩展版的子集，或者
```shell
$ egrep "[a-z]+" filename
```

## -o 只输出匹配到的文本

## -v 反转匹配

## -c 统计文本行数

## -n 行号

## -b 偏移

## -l 匹配所在的文件

## -R 递归

## -i 忽略大小写

## -e 指定多个匹配模式

## --include 递归搜索

## --exclude 排除

## --exclude-dir 排除目录

## grep的静默输出
```shell
#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 match_text filename"
    exit 1
fi

match_text=$1
filename=$2
grep -q "$match_text" $filename 

if [ $? -eq 0 ]; then
    echo "The text exits in the file"
else
    echo "Text does not exits in the file"
fi
```


## -A 打印匹配之后的行

## -B 打印匹配之前的行

## -C 之前及之后的行