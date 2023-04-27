#!/bin/bash

echo パスワードマネージャーへようこそ！
echo サービス名を入力してください：
read service_name
echo ユーザー名を入力してください:
read user_name
echo パスワードを入力してください:
read pass
echo Thank you!

for word in "service name" $service_name "user name" $user_name "pass" $pass ""
do
    echo $word >> pass_list.txt 
done



