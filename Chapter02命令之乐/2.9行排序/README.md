# 行排序

## sort

### 按照数字顺序排序
```shell
$ cat file.txt
9
3
5
2

$ sort -n file.txt
2
3
5
9
```


### 逆序排序
```shell
sort -r file.txt
9
5
3
2
```


### 合并两个已经排序过的文件
```shell
$ sort -m sorted1 sorted2
```


### 找出已排序文件中不重复的行
```shell
$ sort file1.txt file2.txt | uniq
```



### 检查文件是否已经排序过
```shell
#!/bin/bash
sort -C file.txt ;
if [ $? -eq 0 ]; then
    echo Sorted;
else
    echo Unsorted;
fi
```

### 指定排序的列
```shell
$ cat data.txt
1 mac   2000
2 winxp     4000
3 bsd    1000
4 linux     1000

$ sort -nk 3 data.txt
3 bsd    1000
4 linux     1000
1 mac   2000
2 winxp     4000
```
注意，如果要采用数字进行排序，则应该明确地给出`-n`选项

### 指定要排序的一定范围的字符
```shell
$ cat data2.txt
1 alpha 300
2 beta 200
3 gamma 100

$ sort -bk 2.3,2.4 data2.txt
3 gamma 100
1 alpha 300
2 beta 200
```
按照m、p、t的顺序

### 忽略前导空白行，字典序
`-b`
`-d`


## uniq
uniq只能作用于排过序的数据
```shell
$ cat sorted.txt
bash
foss
hack
hack

$ uniq sorted.txt
bash
foss
hack
```


### 只显示唯一的行
`-u`

### 统计各行在文件出现的次数
```shell
$ uniq -c sorted.txt
      1 bash
      1 foss
      2 hack
```

### 找出重复的行
`-d`

### 跳过、比较字符数
`-s`指定跳过前N个字符
`-w`指定用于比较的最大字符数
```shell
$ cat data3.txt
u:01:gnu
d:04:linux
u:01:bash
u:01:hack

$ sort data3.txt | uniq -s 2 -w 2
d:04:linux
u:01:bash
```