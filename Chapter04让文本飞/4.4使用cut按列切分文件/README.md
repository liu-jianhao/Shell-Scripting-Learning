# 使用cut按列切分文件
每一列称为一个字段
## -f 指定提取的字段

## --conplement 显示没有被-f指定显示的字段

## -d 设置分隔符
```shell
$ cat delimited_data.txt
No;Name;Mark;Percent
1;Sarath;45;90
2;Alex;49;98
3;Anu;45;90

$ cut -f2 -d";" delimited_data.txt
Name
Sarath
Alex
Anu
```
## 指定字段的字符或字节范围
+ `N-` 从第N个字节、字符、字段开始到行尾
+ `N-M` 从第N个字节、字符、字段开始到第M个
+ `-M` 从第1个字节、字符、字段开始到第M个

+ -b 字节
+ -c 字符
+ -f 字段