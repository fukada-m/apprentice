p "好きな数字を入力してください:"

# ユーザーから入力値を受け取る
user_input_val = gets.chomp

# 整数に変換して値を２倍にする
user_input_val = user_input_val.to_i * 3

puts "2倍の数値です：#{user_input_val}"
