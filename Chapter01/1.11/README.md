# 调试脚本
## -x
使用`-x`选项的脚本可以打印出所执行的每一行命令以及当前状态
例如：
```shell
#!/bin/bash
for i in {1..6}
do
    set -x
    echo $i
    set +x
done
echo "Script executed"
```
输出
```
+ set -x
+ echo {1..6}
{1..6}
+ set +x
Script executed
```

## 自定义`_DEBUG`
`-x`选项是Bash内建的，我们还可以通过定义`_DEBUG`环境变量来启用或禁止调试及生成特定形式的信息，例如
```shell
#!/bin/bash
function DEBUG()
{
    [ "$_DEBUG" == "on" ] && $@ || :
}
for i in {1..10}
do
    DEBUG echo "I is $i"
done
```
可将调试功能设置为on来运行上面的脚本
```shell
_DEBUG=on ./script.sh
```
我们在每一条需要打印调试信息的语句前加上`DEBUG`。如果没有把`_DEBUG=on`传递给脚本，那么调试信息就不会打印出来


## 总结
1. `set -x`：在执行时显示参数和命令
2. `set -y`：禁止进行读取时显示输入
3. `set -v`：当前命令进行读取时显示输入
4. `set +v`：禁止打印输入

## shebang的妙用
把shebang从`#!/bin/bash`改成`#!/bin/bash -xv`，这样就可以不用任何其他选项就可启动调试功能

## 显示行号
将环境变量PS4设置为`$LINENO:`
```shell
PS4='$LINENO:'
```
