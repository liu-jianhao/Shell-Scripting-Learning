# 文件描述符与重定向
## >
添加到右边的文件中
## >>
追加
## 2>
将错误信息重定向到out.txt
```shell
ls + 2> out.txt
```
将`stderr`和`stdout`都重定向到同一个文件
```shell
cmd &> output.txt
```
## /dev/null
黑洞，它会丢弃所接收到的任何数据
## < & <<
重定向脚本内部的文本快
```shell
#!/bin/bash
cat << EOF > log.txt
This is a generated file. Do not edit. Changes will be overwritten.
EOF
```
出现在`cat << EOF > log.txt`与下一个EOF行之间的所有文本行都会被当作stdin数据

## 自定义文件描述符
`exec`命令创建全新的文件描述符。常见的打开模式有3钟：

1. 只读模式 `<`
```shell
echo this is a test line > input.txt
exec 3<input.txt # 创建
cat <&3
```
2. 追加写入模式 `>`
```shell
exec 4>output.txt # 创建
echo newline >&4
cat output.txt
```
3. 截断写入模式 `>>`
```shell
exec 5>>input.txt # 创建
echo appended line >&5
cat input.txt
```

