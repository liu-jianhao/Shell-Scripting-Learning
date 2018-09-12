# 字符分隔符与迭代器

## IFS(Internal Field Separator)，内部字段分隔符
IFS是一个环境变量，默认值是空白字符(换行符、制表符、空格)

```shell
#!/bin/bash
data="name,gender,roolno,location"
echo data: $data

oldIFS=$IFS
IFS=,
for item in $data
do
    echo Item: $Item
done

IFS=$oldIFS
```
输出：
```
data: name,gender,rollno,location
Item: name
Item: gender
Item: rollno
Item: location
```

## 以`/etc/passwd`为例
```shell
#!/bin/bash
line="root:x:0:0:root:/root:/bin/bash"
oldIFS=$IFS
IFS=":"
count=0
for item in $line
do
    [ $count -eq 0 ] && user=$item
    [ $count -eq 6 ] && shell=$item
    let count++
done

IFS=$oldIFS
echo $user\'s shell is $shell
```
输出：
```shell
root's shell is /bin/bash
```
