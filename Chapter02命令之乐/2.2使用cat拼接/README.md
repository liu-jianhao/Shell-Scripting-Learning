# 用`cat`进行拼接
`cat`能够将标准输入数据与文件数据组合在一起

## 将`stdin`和另一个文件中的数据组合在一起
```shell
echo 'Text through stdin' | cat - file.txt
```
`-`被作为`stdin`文本的文件名

## 去掉多余的空白行
```shell
cat -s file
```

## 将制表符显示为^I
选项`-T`