# 检查目录以及其中的文件与子目录

## 生成文件以及子目录汇总信息
```shell
#!/bin/bash

for d in `find $1 -type d`;
do
    echo `find $d -type f | wc -l` files in $d;
done
```
```shell
$ ./info.sh .
2 files in .
```