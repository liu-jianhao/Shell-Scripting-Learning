# 使用awk进行高级文本处理

## 结构
```shell
awk 'BEGIN{ print "start" } pattern { commands } END{ print "end" }' file
```
如果没有提供模式，就认为所有行都是匹配的

## 输出文件的行数
```shell
awk 'BEGIN{ i=0 } { i++ } END{ print i }' filename
```

## 双引号当做拼接操作符
```shell
$ echo | awk '{ var1="v1"; var2="v2"; print var1 "-" var2; }'
v1-v2
```

## 特殊变量
+ NR    表示记录编号，以行作为记录时，该变量相当于当前行号
+ NF    表示字段数量，在处理当前记录时，相当于字段数量。默认的字段分割符是空格。
+ $0    该变量包含当前记录的文本内容。
+ $1    该变量包含第一个字段的文本内容


## 用getline读取行
```shell
$ seq 5 | awk 'BEGIN{ getline; print "Read ahead first line", $0 } { print $0 }'
Read ahead first line 1
2
3
4
5
```

## 使用过滤模式对awk处理的行进行过滤
例如：
```shell
awk 'NR < 5'    # 行号小于5的行
awk 'NR==1,NR==4'   # 行号在1到5之间的行
awk '/linux/'   # 包含模式为linux的行
```

## 设定字段分隔符 -F
```shell
awk -F: '{ print $NF }' /etc/passwd
```

## awk的关联数组
以字符串为索引的数组，`arrayname[index]`

## 在awk中使用循环
```shell
for(i=0;i<10;i++) { print $i; }
```
或者
```shell
for(i in array) { print array[i]; }
```

将收集到的数据存入数组并显示出来:
```shell
$ awk 'BEGIN{FS=":"} {nam[$1]=$5} END{for(i in nam) {print i,nam[i]}}' /etc/passwd
```


## awk內建的字符串处理函数
+ length(string)
+ index(string, search_string)  返回位置
+ split(string, array, delimiter)   以delimiter作为分隔符分割字符串string，存入array
+ substr(string, start-position, end-position)
+ sub(regex, replacement_str, string)   将正则表达式regex匹配到的第一处内容替换成replacement_str
+ gsub(regex, replacement_str, string)  匹配的所有内容都替换
+ match(regex, string)  检查正则表达式regex能否在string中找到匹配。能就返回非0值，否则返回0