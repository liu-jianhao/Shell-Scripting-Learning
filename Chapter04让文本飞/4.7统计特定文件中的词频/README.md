# 统计特定文件中的词频

```shell
#!/bin/bash
if [ $# -ne 1 ];
then    echo "Usage: $0 filename";    exit -1;
fi
filename=$1
egrep -o "\b[[:alpha:]]+\b" $filename | \
    awk '{ count[$0]++ }
        END
        { 
            printf("%-14s%s\n", "Word", "Count");
            for(ind in count)
            {                
                printf("%-14s%d\n", ind, count[ind]);
            }
        }'
```
+ `egrep`命令将文本文件转换成单词流，每行一个单词。模式`\b[[:alpha:]]+\b`能够匹配到每个单词去掉空白字符和标点符号。选项`-o`打印出匹配到的单词，一行一个。
+ `awk`命令统计每个单词。`count`是关联数组，`$0`是当前行