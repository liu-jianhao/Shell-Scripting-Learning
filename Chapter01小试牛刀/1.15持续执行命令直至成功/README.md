# 持续运行命令直至成功

## 函数
定义以下函数:
```shell
repeat()
{
    while true
    do
        $@ && return
    done
}
```
该函数以函数参数的形式传入命令

## 一种更快的方法
在现代大多数系统，`true`是作为`/bin`中的一个二进制文件来实现，这意味着每执行一次while循环，shell就不得不生成一个进程。为了避免这种情况，可以使用shell的內建命令`:`，该命令的退出状态总是0：
```shell
repeat() { while :; do  $@ && return; done }
```

## 加入延时
```shell
repeat() { while :; do  $@ && return; sleep 30; done }
```
