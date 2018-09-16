# xargs
xargs命令从stdin处读取一系列参数，然后使用这些参数来执行指定命令。它能将单行或多行输入文本转换成其他格式，例如单行变多行或是多行变单行

xargs命令应该紧跟在管道操作符之后。它使用标准输入作为主要的数据源，将stdin中读取的数据作为指定命令的参数并执行该命令

## 将一组C语言源码文件中搜索字符main
```shell
$ ls *.c | xargs grep main
```

## 多行输入转换成单行输出
```shell
$ cat example.txt
1 2 3 4 5 6
7 8 9 10
11 12
$ cat example.txt | xargs
1 2 3 4 5 6 7 8 9 10 11 12
```

## 单行变多行
```shell
$ cat example.txt | xargs -n 3
1 2 3
4 5 6
7 8 9
10 11 12
```
`-n`选项限制每次调用命令时用到的参数个数


## 分隔符
`xargs`默认使用空白字符分割输入并执行`/bin/echo`

`-d`选项指定分隔符
```shell
$ echo "split1Xsplit2Xsplit3X" | xargs -d X
split1 split2 split3
```


## 与`find`结合使用
搜索`.docx`文件，这些文件通常包含大写字母和空格，再使用`grep`找出内容不包括image的文件
```shell
$ find . -iname '*.docx' -print0 | xargs -0 grep -L image
```

统计c程序的行数
```shell
$ find . -type f -name "*.c" -print0 | xargs -0 wc -l
```


## 结合stdin，运用while语句和子shell
xargs会将参数放置在指定命令的尾部，因此无法为多组命令提供参数。

子shell利用while循环读取参数并执行命令
```shell
$ cat files.txt | ( while read arg; do cat $arg; done )
```


shell的`-c`选项可以调用子shell来执行命令行脚本。他可以与`xargs`结合解决多次替换的问题。下面的命令找出所有的c文件并显示出每个文件的名字，文件名前会加一个换行符(`-e`选项允许进行转义替换)在文件名之后就是该文件中含有main的所有行
```shell
$ find . -name "*.c" | xargs -I ^ sh -c "echo '\n ^: '; grep main ^"
```