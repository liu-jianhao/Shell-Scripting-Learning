# 使用变量和环境变量
## 准备知识
1. 可以使用`env`或`printenv`命令来查看当前shell中所定义的全部环境变量
2. 查看其他进程的环境变量：
```shell
cat /proc/$PID/environ
```
假设有一个叫做geidt的程序正在运行，可以使用`pgrep`命令获得gedit的进程ID：
```shell
pgrep gedit
```
补充：
想要生成一份易读的报表，可以将`cat`命令的输出通过管道传给tr，将其中的\0替换成\n:
```shell
cat /proc/$PID/environ | tr '\0' '\n'
```

## =赋值
```shell
varName=value
```
注意：
var = value 不等于 var=value。两边没有空格的等号是赋值操作符，有空格的是等量关系测试

variables.sh:
```shell
#!/bin/bash
fruit=apple
count=5
echo "We have $count ${fruit}(s)"
```
因为shell使用空白字符来分隔单词，所以我们需要加上一对花括号来告诉shell这里的变量名是fruit，而不是fruit(s)

## export
export命令声明了将由子进程所继承的一个或多个变量。

## 补充
1. 获得字符串的长度：
```shell
length=$(#var)
```
2. 识别当前所使用的shell
```shell
echo $SHELL
```
Or
```shell
echo $0
```
3. 检查是否为超级用户
环境变量UID中保存的是用户ID
```shell
if [ $UID -ne 0 ]; then
    echo Non root user. Please run as root.
else
    echo Root user
fi
```
4. 修改Bash的提示字符串
查看设置变量PS1的那一行
```shell
cat ~/.bashrc | grep PS1
```
修改提示字符串
```shell
PS1="PROMPT>"
```