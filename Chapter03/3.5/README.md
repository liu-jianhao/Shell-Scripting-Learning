# 文件权限和粘滞位

## 设置粘滞位
粘滞位应用于目录，设置后只有目录的所有者才能够删除目录中的文件，及时其他人有该目录的而写权限也无法执行删除操作
```shell
$ chmod a+t directory_name
```

## 以不同身份运行可执行文件（setuid）
`setuid`允许其他用户以文件所有者的身份来执行文件

首先将文件的所有权更改为需要执行该文件的用户，然后以该用户的身份登录
```shell
$ chmod +s executable_file
# chown root:root executable_file
# chmod +s executable_file
$ ./excutable_file
```
`setuid`只能应用在LinuxELF格式的二进制文件上，不可以对脚本设置