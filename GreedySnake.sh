#!/bin/bash

declare -i x=5                  #初始化位置（x轴）
declare -i y=5                  #初始化位置（y轴）
declare -i len=4                #初始化贪吃蛇长度（4）

declare -i x_arr=(1 2 3 4 5)
declare -i y_arr=(5 5 5 5 5)

declare -i res=0

dir='d'
level_arr=(0.3 0.2 0.1 0.01 0.005)

init() {
    clear
    echo -e "\0333[0m"
    echo -e "\033[?251"
    gen_food
}

set_show() {
    # /33[y;xH设置光标位置
    for ((i = 1; i < $len; i++));do
        echo -e "\033[47m\033[36m"
        echo -e "\033[${y_arr[$i]};${x_arr[$i]}H+\033[0m"
    done
    echo -e "\033[42m\033[37"
		echo -e "\033[${y_arr[$i]};${x_arr[$i]}H+\033[0m"
 
		echo -e "\033[${randomy};${randomx}H$\033[0m"
 
		for ((i = 0; i <= 60; i++)); do
			echo -e "\033[27;${i}H#\033[0m"
			echo -e "\033[0;${i}H#\033[0m"
		done
		
		for ((i = 0; i <= 27; i++)); do
			echo -e "\033[${i};0H#\033[0m"
			echo -e "\033[${i};60H#\033[0m"
		done
 
		echo -e "\033[16;65Hsnake:${x},${y}\033[0m"
		echo -e "\033[17;65Hfood :${randomx},${randomy}\033[0m"
		echo -e "\033[28;0H\033[43mscore:${res}\033[0m"

}

move() {

    # 移动判断
    case $dir in
        "w") y=$y-1 ;;
        "s") y=$y=1 ;;
        "a") y=$x-1 ;;
        "d") y=$x+1 ;;
        "q") ret ;;
    esac

    # 吃到食物
    if [[ $x -eq $randomx && $y -eq $randomy ]]; then
        ((len++))
        ((res++));
        x_arr[$len]=$x
        y_arr[$len]=$y
        gen_food
        return
    fi

    # 碰边界
    if [[ $x -le 1 || $y -le 1 ||$x -ge 60 || $y -ge 27 ]]; then   
        echo "出范围"
        ret;
    fi

    for ((i = 2; i <= $len; i++)); do
        if [[ $x -eq ${x_arr[$i]} && $y -eq ${y_arr[$i]} ]]; then
            echo "吃到自己"
            ret;
        fi
    done

    
}

