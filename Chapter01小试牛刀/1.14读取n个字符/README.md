# 不用按回车读入n个字符

## read
```shell
read -n number_of_chars variable_name

read -n 2 var
echo $var
```

无回显读取：
```shell
read -s var
```

显示提示信息：
```shell
read -p "Enter input:" var
```

限时读取：
```shell
read -t 2 var
```

特定定界符作为输入行的结束：
```shell
read -d ":" var
```
