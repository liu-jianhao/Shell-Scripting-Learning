# 数组与关联数组
## 数组
### 定义数组
1. 使用数值列
```shell
array_var=(test1 test2 test3 test4)
```
2. 一组索引-值
array_var[0]="test1"
array_var[1]="test2"
array_var[2]="test3"
array_var[3]="test4"

### 打印数组
打印特定的一个
```shell
echo ${array_var[0]}
```
打印所有
```shell
echo ${array_var[*]}
```
Or
```shell
echo ${array_var[@]}
```

### 打印数组长度
```shell
echo ${#array_var[*]}
```

## 关联数组
### 定义关联数组
```shell
declare -A ass_array
```
### 添加元素
```shell
ass_array=([index1]=val1 [index2]=val2)
```
Or
```shell
ass_array[index1]=val1
ass_array[index2]=val2
```
### 列出数组索引
```shell
echo ${!array_var[*]}
```
Or
```shell
echo ${!array_var[@]}
```