#!/bin/bash
loop=true

echo "パスワードマネージャーへようこそ！"
choose_option="次の選択肢から入力してください(Add Password/Get Password/Exit)："

while [ $loop = true ]
do
    echo $choose_option
    read choice

    if [ "$choice" = "a" ]; then
        echo サービス名を入力してください：
        read service_name
        echo ユーザー名を入力してください:
        read user_name
        echo パスワードを入力してください:
        read pass
        echo Thank you!

        for word in "サービス名:$service_name" "ユーザー名:$user_name" "パスワード:$pass"
        do
            echo $word >> /home/fukada/apprentice/quest/week-3-4/submission_quest/pass_list.txt
        done
        echo パスワードの追加は成功しました。
    elif [ "$choice" = "b" ]; then
        echo "サービス名を入力してください："
        read search_service_name
        grep  -A 2 "$search_service_name" /home/fukada/apprentice/quest/week-3-4/submission_quest/pass_list.txt
        if [ "$?" = 1 ]; then
            echo "そのサービスは登録されていません。"
        fi
    elif [ "$choice" = "c" ]; then
        loop=false
        echo "Thank you!"
    else
        choose_option="入力を間違えています。Add Password/Get Password/Exit から入力してください。"
    fi
done
