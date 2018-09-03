# 获取并设置时期及延迟
## 读取日期
```shell
date
```
## 打印纪元时
```shell
date +%s
```
## 将日期转换成纪元时
```shell
date --date "Wed mar 15 08:09:16 EDT 2018" +%s
```
## 找出指定日期是星期几
```shell
date --date "Sept 3 2018" +%A
```
## 格式化日期
```shell
date "+%d %B %Y"
```
用带有前缀`+`的格式化字符串作为date命令的参数，可以按照你的选择打印出相应的格式的日期
## 设置日期和时间
```shell
date -s "21 June 2019 11:02:55"
```
如果系统已经联网可以使用`ntpdate`来设置日期和时间
```shell
/usr/sbin/ntpdate -s time-b.nist.gov
```
