# 查找并删除重复文件

首先创建一些测试文件
```shell
$ echo "hello" > test; cp test test_copy1; cp test test_copy2;
$ echo "next" > other;
```

## remove_duplicates.sh
```shell
#!/bin/bash
ls -lS --time-style=long-iso | awk 'BEGIN {
    getline; getline;
    name1=$8; size=$5
}
{
    name2=$8;
    if(size==$5)
    {
        "md5sum "name1 | getline; csum1=$1;
        "md5sum "name2 | getline; csum2=$1;
        if(csum1==csum2)
        {
            print name1; print name2;
        }
    };

    size=$5; name1=name2;
}' | sort -u > duplicate_files

cat duplicate_files | xargs -I {} md5sum {} | \
    sort | uniq -w 32 | awk '{ print $2 }' | \
    sort -u > unique_files

echo Removing..
comm duplicate_files unique_files -3 | tee /dev/stderr | \
    xargs rm
echo Removed duplicate files successfully.
```

## 解释
+ `ls -lS --time-style=long-iso`的作用：按文件大小排序，并依照ISO格式打印， 这样大小相同的文件就会排列在一起，接下来计算文件的校验和，相同就是重复文件
+ 在进行主要处理前，首先执行`awk`的`BEGIN{}`语句块。该语句块读取所有文件的行并初始化变量。`ls`输出的第一行是文件的总数量，用`getline`读取然后舍弃。
+ `"cmd"| getline`可以读取外部命令的输出。读入一行后，该行保留在`$0`中，行中的每一列分别保存在`$1、$2...`中。
+ 每组重复的文件中的一个采样就被写入`unique_files`文件
+ 现在需要将`duplicate_files`中列出的未包含在`unique_files`内的文件全部删除，用`comm`做差集，但要先排序
+ `tee`可以将文件名传给`rm`命令并输出