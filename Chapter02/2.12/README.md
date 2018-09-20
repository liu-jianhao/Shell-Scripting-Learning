# 根据扩展名切分文件名


## 提取文件名
```shell
$ file_jpg="sample.jpg"
$ name=${file_jpg%.*}
$ echo File name is : $name
File name is : sample
```
`${VAR%.*}`的含义：
+ 从`$VAR`中删除位于`%`右侧的通配符所匹配的字符串。通配符从右向左进行匹配
+ `%`从右到左找出匹配通配符的最短结果，`%%`则是最长
```shell
$ VAR=hack.fun.book.txt
$ echo ${VAR%.*}
hack.fun.book
$ echo ${VAR%%.*}
hack
```


## 提取扩展名
```shell
$ extension=${file_jpg#*.}
$ echo extension name is : $extension
extension name is : jpg
```
`#`与`%`类似，但是从左到右匹配，同样也有`##`