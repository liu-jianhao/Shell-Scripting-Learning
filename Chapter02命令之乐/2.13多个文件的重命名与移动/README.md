# 多个文件的重命名与移动

## rename.sh
这个脚本利用`find`查找PNG和JPEG文件，然后使用`##`操作符和`mv`将查找到的文件重命名为image-1.EXT、image-2.EXT等

```shell
#!/bin/bash
count=1;
for img in `find . -iname '*.png' -o -iname '*.jpg' -type f -maxdepth 1`do
    new=image-$count.${img##*.}    echo "Renaming $img to $new"    mv "$img" "$new"
    let count++
done
```
`-o`选项用于指定多个`-iname`选项，后者用于进行大小写无关匹配

`${img##*.}`从当前处理的文件名中解析出扩展名


## rename
将文件名中的空格替换成字符“_”
```shell
$ rename 's/ /_/g' *
```

转换文件名的大小写
```shell
$ rename 'y/A-Z/a-z/' *

$ rename 'y/a-z/A-Z/' *
```