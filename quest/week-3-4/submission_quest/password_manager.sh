#!/bin/bash
loop=true

input_data()
{
    read -p "サービス名を入力してください：" service_name
    read -p "ユーザー名を入力してください:" user_name
    read -p "パスワードを入力してください:" -s password
    echo "Thank you!"
}

write_pass_list()
{
    for word in "サービス名:$service_name" "ユーザー名:$user_name" "パスワード:$password"
    do
        echo $word >> /home/fukada/apprentice/quest/week-3-4/submission_quest/pass_list.txt
    done
}

save_pass()
{
    input_data
    write_pass_list
    echo パスワードの追加は成功しました。
    choose_option="次の選択肢から入力してください(Add Password/Get Password/Exit)："
}

read_pass()
{
    echo "サービス名を入力してください："
    read search_service_name
    grep  -A 2 "^サービス名:$search_service_name$" /home/fukada/apprentice/quest/week-3-4/submission_quest/pass_list.txt
    if [ "$?" = 1 ]; then
        echo "そのサービスは登録されていません。"
    fi
    choose_option="次の選択肢から入力してください(Add Password/Get Password/Exit)："
}

end ()
{
    loop=false
    echo "Thank you!"
}



echo "パスワードマネージャーへようこそ！"
choose_option="次の選択肢から入力してください(Add Password/Get Password/Exit)："
while [ $loop = true ]
do
    echo $choose_option
    read choice
    if [ "$choice" = "Add Password" ]; then
        save_pass
    elif [ "$choice" = "Get Password" ]; then
        read_pass
    elif [ "$choice" = "Exit" ]; then
        end
    else
        choose_option="入力を間違えています。Add Password/Get Password/Exit から入力してください。"
    fi
done
