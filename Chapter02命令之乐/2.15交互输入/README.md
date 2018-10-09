# 交互输入自动化

## backup.sh
```shell
#!/bin/bash

read -p " What folder should be backed up: " folder
read -p " What type of files should be backed up: " suffix

find $folder -name "*.$suffix" -a ! -name '~*' -exec cp {} \
    $BACKUP/$LOGNAME/$folder
echo "Backed up files from $folder to $BACKUP/$LOGNAME/$folder
e"
```


## expect
```shell
#!/usr/bin/expect

spawn ./backup.sh
expect {
    "*folder*" {
        send "notes\n"
        exp_continue
    }
    "*type*" {
        send "docx\n"
        exp_continue
    }
}
```
`spawn`命令的参数是需要自动化运行的应用程序及其参数

`expect`命令接受一组模式以及匹配模式时要执行的操作。操作需要放入花括号中

`send`命令是要发送的信息