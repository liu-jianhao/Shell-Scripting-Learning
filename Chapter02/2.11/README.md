# 分割文件与数据

## split
`split`命令可以用来分割文件。该命令接受文件名作为参数，然后创建出一系列体积更小的文件，其中依据字母序排在首位的那个文件对应与原始文件的第一部分，以此类推

例如有一个50KB的小文件，在`split`命令中处理k、还可以使用M（MB）、G（GB）、c（byte）、w（word）
```shell
$ split -b 10k data.file
$ ls
data.file xaa xab xac xad xaf
```