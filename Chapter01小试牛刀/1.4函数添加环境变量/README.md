# 使用函数添加环境变量
在`.bashrc`文件中定义如下函数，简化路径缇娜及操作：
```shell
prepend() { [ -d "$2" ] && eval $1=\"$2':'\$$1\" && export $1; }
```
使用方法：
```shell
prepend PATH /opt/myapp/bin
```