# 查找并列出文件

## find

### 列出给定目录下所有的文件和子目录：
```shell
$ find . -print
```

### 根据文件名或正则表达式进行搜索
```shell
$ find /home/liu -name '*.txt' -print
```
`-name`选项指定了带查找文件名的模式，可以使通配符或正则表达式，忽略大小写可用`-iname`

```shell
$ find . \( -name '*.txt' -o -name '*.pdf' \) -print
```
`o`或者`or`执行逻辑或操作

逻辑与：`-and`

### 匹配.py或.sh文件
```shell
$ find . -regex '.*\(\.py\|sh\)$'
```

### 否定参数
```shell
$ find ! /home/liu -name '*.txt' -print
```


### 限制目录深度的搜索
```shell
$ find -L /proc -maxdepth 1 -name 'bundlemaker.def' 2>/dev/null
```
+ `-L`选项告诉find命令跟随符号链接
+ `-maxdepth 1` 搜索范围仅限在当前目录
+ `2>/dev/null` 将有关循环链接的错误信息发送到空设备中

### 根据文件类型搜索
只列出所有目录:
```shell
$ find . -type d -print
```
+ 普通文件：f
+ 符号链接：l
+ 目录：d
+ 字符设备：c
+ 块设备：b
+ 套接字：s
+ FIFO：p


### 根据文件的时间戳进行搜索
每一个文件都有三种时间戳：
1. 访问时间，-atime，用户最后一次访问文件的时间
2. 修改时间，-mtime，文件内容最后一次被修改的时间
3. 变化时间，-ctime，文件元数据最后一次改变的时间

打印最近7天内被访问的所有文件：
```shell
$ find . -type f -atime -7 -print
```
打印恰好7天被访问的所有文件：
```shell
$ find . -type f -atime 7 -print
```
打印超过7天被访问的所有文件：
```shell
$ find . -type f -atime +7 -print
```

以分钟为单位的选项：
1. -amin
2. -mmin
3. -cmin

`-newer`选项可以指定一个用于比较修改时间的参考文件

找出比file.txt修改时间更近的所有文件
```shell
$ find . -type f -newer file.txt -print
```


### 基于文件大小的搜索
`-size`

### 基于文件权限和所有权的匹配
打印出权限为644的文件
```shell
$ find . -type f -perm 644 -print
```

打印出用户liu拥有的所有文件：
```shell
$ find . -type f -user liu -print
```

### 利用fand执行相应的操作
删除匹配的文件
```shell
$ find . -type f -name "*.swp" -delete
```

执行命令，例如，将十天前的.txt文件复制到OLD目录中：
```shell
$ find . -type f -mtime +10 -name "*.txt" -exec cp {} OLD \;
```


### 跳过特定的目录
`-prune`