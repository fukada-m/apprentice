#!/bin/bash

echo パスワードマネージャーへようこそ！
echo サービス名を入力してください：
read service_name
echo ユーザー名を入力してください:
read user_name
echo パスワードを入力してください:
read pass
echo Thank you!

echo "service name" >> pass_list.txt 
echo $service_name >> pass_list.txt
echo "user name" >> pass_list.txt
echo $user_name >> pass_list.txt
echo "pass" >> pass_list.txt
echo $pass >> pass_list.txt
echo "" >> pass_list.txt
