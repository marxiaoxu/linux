#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "需要管理员权限运行此脚本。"
    # 尝试使用sudo运行脚本
    sudo "$0" "$@"
    exit $?
fi

while true
do
echo "模式1 输入信息"
echo "模式2 查询信息"
echo "模式3 删除信息"
echo "模式4 查看信息"
echo "模式5 更新信息"
echo "模式6 退出脚本"

read -p "选择进入的模式:" mod

if ((mod ==1)); then


read -p "请输入用户名" name
read -p "密码" password
read -p "邮箱" email
{
    echo "用户名: $name"
    echo "密码: $password"
    echo "邮箱: $email"
}>> user_info.txt
fi



if ((mod ==2)); then


echo "查询密码和邮箱	"

read -p "请输入用户名	" name2



if [ "$name" == "$name2" ]; then

echo "$password  $email"
else
echo "错误信息"
fi


fi

if ((mod ==3)); then


echo "开始删除	"
read -p "请输入要删除的账户名	" name3
read -sp "请输入管理员密码" mm
if [ "$mm" == "admin123" ]; then

     if [ "$name" == "$name2" ]; then

	echo -n "" > user_info.txt
	 echo "该用户所有信息删除成功"
else echo "没有此用户"
    fi
else echo "密码错误"
	
fi

fi


if ((mod ==4)); then

grep -v "密码:" user_info.txt




fi

if ((mod ==5)); then
echo "更新邮箱	"
read -sp "请输入管理员密码" mm
if [ "$mm" == "admin123" ]; then

    if ((name3 == name));then
         echo "更新用户邮箱地址成功"
else echo "没有此用户"
    fi
else echo "密码错误,不是管理员"
fi


fi

if ((mod ==6)); then
echo "退出脚本	"

break

fi

done
