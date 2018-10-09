#!/bin/bash
echo Count:
tput sc     # 存储光标的位置

for count in `seq 0 5`
do
    tput rc         # 恢复之前存储的光标位置
    tput ed         # 清除从当前光标位置到行尾之间的所有内容
    echo -n $count
    sleep 1
done
