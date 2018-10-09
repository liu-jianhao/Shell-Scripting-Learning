# 临时文件名与随机数
最适合存储临时数据的位置是`/tmp`，该目录下的内容在系统重启后会被清空

## mktemp

### 创建临时文件
```shell
$ filename=`mktemp`

$ echo $filename
/tmp/tmp.2PlYjnqEno
```

### 创建临时目录
```shell
$ dirname=`mktemp -d`
$ echo $dirname
/tmp/tmp.T6OgqZXlWT
```

### 仅生成文件名，不创建实际的文件或目录
```shell
$ tmpfile=`mktemp -u`
$ echo $tmpfile
/tmp/tmp.O7kBsb73Al
```

### 基于模板创建临时文件名
```shell
$ mktemp test.XXX
test.6nM
```
模板中至少要三个X