# 采集终端信息
+ 获取终端的行数和列数
```shell
tput cols
tput lines
```
+ 打印当前的终端名
```shll
tput longname
```
+ 将光标移动到坐标(100,100)处
```shell
tput cup 100 100
```
+ 设置终端背景色
```shell
tput setb n
```
`n`在0到7之间取值
+ 设置终端前景色
```shell
tput setf n
```
`n`在0到7之间取值
+ 设置文本样式为粗体
```shell
tput bold
```
+ 设置下划线的起止
```shell
tput smul
tput rmul
```
+ 删除当前光标位置到行尾的所有内容
```shell
tput ed
```
