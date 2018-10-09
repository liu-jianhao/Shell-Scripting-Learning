# 录制并回放终端会话
`script`命令能够录制你的击键以及击键时机，并输入和输出结构保存在对应的文件中

`scriptreplay`命令可回放会话

## 实例
录制：
```shell
$ script -t 2> timing.log -a output.session

$ tclsh
% puts [expr 2 + 2]
4
% exit
$ exit
```

回放：
```shell
scriptreplay timing.log output.session
```