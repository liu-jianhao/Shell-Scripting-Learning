# 命令输出的传输

## 管道
```shell
cmd1 | cmd2
```

##　管道配合子shell
子shell可以用`()`操作来定义
```shell
cmd_output=$(ls | cat -n)
echo $cmd_output
```
Or（使用反引用）
```shell
cmd_output=`ls | cat -n`
echo $cmd_output
```

## 通过引用子shell的方式保留空格和换行符
```shell
$ cat test.txt
1
2
3

$ out=$(cat test.txt)
$ echo $out
1 2 3

$ out="$(cat test.txt)"
$ echo $out
1
2
3
```
