# 列出网络中所有的活动主机

```shell
#!/bin/bash

for ip in 172.29.1.{1..255};
do
    ping $ip -c 2 &> /dev/null;

    if [ $? -eq 0 ];
    then
        echo $ip is alive
    fi
done
```

循环体放入`()&`，`()`中的命令会在子shell中运行，`&`会将其放入后台
```shell
#!/bin/bash

for ip in 172.29.1.{1..255};
do
    (
        ping $ip -c 2 &> /dev/null;

        if [ $? -eq 0 ];
        then
            echo $ip is alive
        fi
    )&
done
wait
```
`wait`等待所有子进程结束后再终止脚本