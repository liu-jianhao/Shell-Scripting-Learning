# 拼写检查与词典操作

## checkword.sh
```shell
#!/bin/bash

word=$1
grep "^$1$" /usr/share/dict/british-english -q
if [ $? -eq 0 ]; then
    echo $word is a dictionary word;
else
    echo $word is not a dictionary word;
fi
```
在`grep`中，`^`标记着单词的开始，`$`标记着单词的结束，`-q`表示禁止`grep`产生输出


## aspellcheck.sh
```shell
#!/bin/bash

word=$1
output=`echo \"$word\" | aspell list`

if [ -z $output  ]; then
    echo $word is a dictionary word;
else
    echo $word is not a dictionary word;
fi
```
当输入的不是一个词典单词时，`aspell list`命令会产生输出，否则不会产生任何输出

`-z`用于确认`$output`是否为空


## look
`look`命令可以显示出以特定字符串起始的行。

可以在日志文件中查找特定日期为首的记录，或是在词典中查找以特定字符串开头的单词

`look`默认会搜索`/usr/share/dict/words`

```shell
$ look word

$ look 'Aug 30' /var/log/syslog
```