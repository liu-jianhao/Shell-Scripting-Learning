# 使用配置文件定制Bash
当用户登录shell时，会执行下列文件：
```
/etc/profile, $HOME/.profile, $HOME/.bash_login, $HOME/.bash_profile /
```

如果`.bash_profile`或`.bash_login`文件存在，则不会去读取`.profile`文件

交互式shell或ssh执行单条命令时，会读取并执行以下文件：
```
/etc/bash.bashrc $HOME/.bashrc
```

当用户登出会话时，会执行一下文件：
```shell
$HOME/.bash_logout
```