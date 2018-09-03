# 别名
## 创建别名
```shell
alias new_command='command sequence'
```
### 注意
alias命令的效果只是暂时的。一旦关闭了当前终端，所有设置的别名就失效了，为了使别名在所有的shell中可用，可以将其定义放在`~/.bashrc`文件中

## 删除别名
（如果有的话）从`~/.bashrc`中删除，或者使用`unalias`命令

## rm备份
```shell
alias rm='cp $@ ~/backup && rm $@'
```

## 对别名进行转义
```shel
\command
```
字符`\`可以转义命令，从而执行原本的命令
