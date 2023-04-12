#1.比較
#2つの整数 x, y の大小を比較し、xとyの大小関係を出力する関数 greater
def greater (x ,y)
    # xよりyが大きい
    if x > y
        puts "x > y"
    # xよりyが小さい
    elsif x < y
        puts "x < y"
    # xとyの値が同じなら
    else
        puts "x == y"
    end
end

greater(5, 4)
greater(-50, -40)
greater(10, 10)

# 2.電車の料金
# 東京駅から新宿駅までJR山手線に乗って移動します。12歳以上は大人料金で200円、6歳以上12歳未満はこども料金で100円、
# 6歳未満は幼児で無料となります。年齢に応じて東京駅から新宿駅までの料金を出力する関数 train_fare
def train_fare(age)
    # 12歳以上の場合
    if age >= 12
        puts 200
    #6歳以上12歳未満の場合
    elsif age >= 6
        puts 100
    #6歳未満の場合 
    else
        puts 0
    end
end

train_fare(12)
train_fare(6)
train_fare(5)

#3
# 2つのブーリアン値 x と y が与えられ、x と y のうちどちらかが真なら true を出力し、
# 両方真もしくは両方偽なら false を出力する関数 xor を定義してください。
def xor(x, y)
    if x == true && y == true
        puts "false"
    elsif
        x == true || y == true 
        puts "true"
    else
        puts "false"
    end
        
end

  xor(true, true)
  xor(true, false)
  xor(false, true)
  xor(false, false)