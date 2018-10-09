# tr
`tr`可以对来自标准输入的内容进行字符替换、删除以及压缩

## 将输入的字符由大写转换成小写
```shell
$ echo "HELLO WHO IS THIS" | tr 'A-Z' 'a-z'
hello who is this
```
`A-Z`是字符组

## 数字加密与解密
```shell
$ echo 12345 | tr '0-9' '9876543210'
87654
$ echo 87654 | tr '9876543210' '0-9'
12345
```

`ROT13`加密算法，这个算法会将字符移动13个位置，因此文本加密和解密都是用同一个函数
```shell
$ echo "tr came, tr saw, tr conquered." | tr 'a-zA-Z''n-za-mN-ZA-M'
ge pnzr, ge fnj, ge pbadhrerq.

$ echo ge pnzr, ge fnj, ge pbadhrerq. | tr 'a-zA-Z' 'n-za-mN-ZA-M'
tr came, tr saw, tr conquered.
```

## 将制表符转换成空格
```shell
$ tr '\t' ' ' < file.txt
```

## 删除字符 `-d`
```shell
$ echo "Hello 123 World 456" | tr -d '0-9'
Hello  World
```

## 字符组补集 `-c`
```shell
# 删除不在补集中的所有字符
$ echo hello 1 char 2 next 4 | tr -d -c '0-9\n'
124

# 将不在set1中的字符替换成空格
$ echo hello 1 char 2 next 4 | tr -c '0-9' ' '
      1      2      4 
```


## 压缩字符 `-s`
```shell
$ echo "GNU is      not      UNIX.  Recursive     right ?" | tr -s ' '
GNU is not UNIX. Recursive right ?
```

```shell
$ cat sum.txt1
2
3
4
5
$ cat sum.txt | echo $[ $(tr '\n' '+') 0 ]
15
```
`$[ operation ]`执行算术运算

```shell
$ cat test.txt
first 1
second 2
third 3
$ cat test.txt | tr -d [a-z] | echo "total: $[$(tr ' ' '+')]"
total: 6
```


## 字符类
+ alnum     字母和数字
+ alpha     字母
+ cntrl     控制(非打印)字符
+ digit     数字
+ graph     图形字符
+ lower     小写字母
+ print     可打印字符
+ punct     标点符号
+ space     空白字符
+ upper     大写字母
+ xdigit    十六进制字符

使用：
```shell
tr [:lower:] [:upper:]
```