#!/bin/bash
echo "接下来的是石头剪刀布的游戏"
echo "定义1：石头；2：剪刀；3：布"
echo "------------------------------"
NUM=`echo $[RANDOM%3+1]`
#1=石头
#2=剪刀
#3=布
read -p "请输入1-3：" key
case $key in
[1])
        echo "你出的是石头"
;;
[2])
        echo "你出的是剪刀"
;;
[3])
        echo "你出的是布"
;;
esac
case $NUM in
[1])
	echo "小兔出石头"
;;
[2])
	echo "小兔出剪刀"
;;
[3])
	echo "小兔出布"
;;
esac
case $key in
[1])
if [ $NUM -eq 1 ]
  then 
    echo "你们打成平局"
elif [ $NUM -eq 2 ]
  then
    echo "你赢啦，小兔输了"
else
  echo "你输了，呜呜呜，小兔赢了"
fi
;;
[2])
if [ $NUM -eq 1 ]
  then
    echo "你输了，呜呜呜，小兔赢了"
elif [ $NUM -eq 2 ]
  then
    echo "你们打成平局"
else
  echo "你赢啦，小兔输了"
fi
;;
[3])
if [ $NUM -eq 1 ]
  then
    echo "你赢啦，小兔输了"
elif [ $NUM -eq 2 ]
  then
    echo "你输了，呜呜呜，小兔赢了"
else
  echo "你们打成平局"
fi
;;
esac
