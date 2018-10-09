# 在终端中显示输出
## echo
```shell
echo "Welcome to Bash"
```
Or
```shell
echo Welcome to Bash
```
Or
```shell
echo 'Welcome to Bash'
```
注意：双引号允许shell解释字符串中出现的特殊字符，单引号不会对其做任何解释
例如：
```shell
echo "Hello World !"
```
运行后出错
要在特殊字符前加上反斜杠(\):
```shell
echo "Hello World \!"
```

## printf
使用方法与在C语言中一样

printf.sh:
```shell
#!/bin/bash
printf "%-5s %-10s %-4s\n" No Name Mark
printf "%-5s %-10s %-4.2f\n" 1 Sarath 80.3456
printf "%-5s %-10s %-4.2f\n" 2 James 90.9989
printf "%-5s %-10s %-4.2f\n" 3 Jeff 77.564
```
得到输出：
```
No    Name       Mark
1     Sarath     80.35
2     James      91.00
3     Jeff       77.56
```

## 补充内容
### 在echo中转义换行符
echo默认会在输出文本尾部追加一个换行符，可使用`-n`来禁止这种行为。echo也可使用`-e`来接受包含转义序列的字符串
### 打印彩色输出
文本颜色颜色码：
```
重置 = ０
黑色 = 30
红色 = 31
绿色 = 32
黄色 = 33
蓝色 = 34
洋红 = 35
青色 = 36
白色 = 37
```
```shell
echo -e "\e[1;31m This is red text \e[0m"
```
其中`\e[1;31m`是转义字符串，设置为红色，\e[0m将颜色重新置回
背景颜色颜色码：
```
重置 = ０
黑色 = 40
红色 = 41
绿色 = 42
黄色 = 43
蓝色 = 44
洋红 = 45
青色 = 46
白色 = 47
```
```shell
echo -e "\e[1;42m Green Background \e[0m"
```