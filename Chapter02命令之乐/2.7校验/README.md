# 校验和与核实
校验和程序用来从文件生成相对较小的唯一密钥

使用最为广泛的校验和算法是MD5和SHA-1

`md5sum`和`sha1sum`程序可以对数据应用对应的算法来生成校验和，它们都是单向散列算法，均无法逆推出原始数据

## md5sum
```shell
$ md5sum README.md
d41d8cd98f00b204e9800998ecf8427e  README.md
```
长度为32个字符的十六进制串

### 生成的文件核实数据完整性
```shell
$ md5sum README.md | md5sum -c
README.md: OK
```

## 对目录进行校验
`md5deep`或`sha1deep`命令可以遍历目录树，计算其中所有文件的校验和