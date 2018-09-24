# 文本文件的交集与差集

## comm
```shell
$ cat A.txt
apple
gold
iron
orange
silver
steel
$ cat B.txt
carrot
cookies
gold
orange
```

```shell
$ comm A.txt B.txt
apple        
        carrot
        cookies
                gold
iron                
                orange
silver
steel
```
第一列是子只`A.txt`出现的行，第二列是子只`B.txt`出现的行，第三列是共同的行

交集：
```shell
$ comm A.txt B.txt -1 -2
gold
orange
```
`-1`、`-2`是指删掉第一行和第二行