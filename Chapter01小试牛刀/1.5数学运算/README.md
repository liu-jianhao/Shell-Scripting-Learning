# 使用shell进行数学运算

## let
let命令可以直接执行基本的算术操作，变量名之前不需要添加`$`，例如：
```shell
no1=4
no2=5
let result=no1+no2
```
## 其他方法
+ 操作符`[]`的使用方法和let命令一样：
```shell
result=$[ no1 + no2 ]
```
+ 操作符`(())`，变量前要加`$`：
```shell
result=$(( no1 + 50))
```
+ `expr`也可以：
```shell
result=`expr 3 + 4`
result=$(expr $no1 + 5)
```
**注意：以上方法支持整数运算，不支持浮点数运算**

## bc
`bc`是一个用于数学运算的高级实用工具，可以借助它执行浮点数运算并使用一些高级函数：
```shell
echo "4 * 0.56" | bc
```
### 设置小数精度
```shell
echo "scale=2;22/7" | bc
```
`scale=2`将小数位个数设置为2

### 进制转换
`bc.sh`
```shell
no=100
echo "obase=2;$no" | bc
no=1100100
echo "obase=10;ibase=2;$no" | bc
```
输出：
```
1100100
100
```

### 计算平方及平方根
```shell
echo "sqrt(100)" | bc
echo "10^10" | bc
```