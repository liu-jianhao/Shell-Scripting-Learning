# 函数和参数
## 函数的定义
```shell
function fname()
{
    statement;
}
```
Or
```shell
fname() { statement; }
```
## 函数的调用
```shell
fname;
```
## 带参数的函数的调用
```shell
fname arg1 arg2;
```

## 脚本参数的访问
1. `$0`是脚本的名称
2. `$1`是第一个参数
3. `$2`是第二个参数
4. `$@`被扩展成"$1""$2"等
5. `$*`被扩展成"$1c$2"，其中c是IFS的第一个字符

## 递归函数
```shell
F()
{
    echo $1;
    F HELLO;
    sleep 1;
}
```

## 导出函数
```shell
export -f fname
```
这样函数的作用域就扩展到子进程中了

## 读取命令返回值
```shell
#!/bin/bash
eval $@
if [ $? -eq 0 ];
then
    echo "$CMD executed successfully"
else
    echo "$CMD terminated successfully"
fi
```
