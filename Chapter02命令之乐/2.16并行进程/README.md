# 并行进程执行

## &
```shell
#!/bin/bash

PIDARRAY=()
for file in File1.iso File2.iso
do
    md5sum $file &
    PIDARRAY+=("$!")
done
wait ${PIDARRAY[@]}
```
`$!`获得最近一个后台进程的PID，将这些PID放入数组，然后使用`wait`命令等待这些进程结束

## parallel
`parallel`命令从`stdin`中读取文件列表，使用类似于`find`命令的`-exec`选项来处理这些文件。符号`{}`代表被处理的文件，符号`{.}`代表无后缀的文件名