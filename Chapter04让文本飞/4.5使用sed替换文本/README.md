# 使用sed替换文本

## 使用另个字符串替换匹配模式
```shell
sed 's/pattern/replace_string/' file
```

## -i 用修改后的数据替换原始文件
```shell
sed -i 's/text/replace' file
```

## 全局替换 g
之前的替换只是替换了每行中的模式首次匹配的内容
```shell
sed 's/pattern/replace_string/g' file
```
替换第N次出现的匹配
```shell
$ echo thisthisthisthis | sed 's/this/THIS/2g'
thisTHISTHISTHIS
```

## 分隔符
`sed`命令会将`s`之后的字符视为命令分隔符。这允许我们更改默认的分隔符`/`：
```shell
$ sed 's:text:replace:g'
$ sed 's|text|replace|g'
```
如果作为分隔符的字符出现在模式中，必须使用`\`进行转义

## 移除空行
```shell
$ sed '/^$/d' file
```
空行的正则表达式：`^$`

最后的`/d`告诉sed不执行替换操作，而是直接删除匹配到的空行

## 直接在文件中替换 -i
```shell
sed 's/pattern/replacement/' -i filename
```
更好的做法，不仅会替换文件内容，还会创建一个名为file.bak的文件，
其中包含原始文件内容的副本:
```shell
sed -i.bak 's/pattern/replacement/' file
```


## 已匹配字符串标记 &
用`&`指代模式所匹配到的字符串，这样就能够在替换字符串时使用已匹配的内容
```shell
$ echo this is an example | sed 's/\w\+/[&]/g'
[this] [is] [an] [example]
```
正则表达式`\w\+`匹配每一个单词，然后用`[&]`替换

## 子串匹配标记
```shell
$ echo this is digit 7 in a number | sed 's/digit \([0-9]\)/\1/'
this is 7 in a number
```
`\1`指代匹配到的第一个子串

## 组合多个表达式
```shell
sed 'expression' | sed 'expression'
```
等同于
```shell
sed 'expression ; expression'
```

## 引用
要想在sed表达式中使用变量，就使用双引号，