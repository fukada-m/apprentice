# 1.100回 "こんにちは！" と出力する関数 hello 
# def say_hello
#     100.times do
#         puts "こんちは！"
#     end

# end

# say_hello()

# 2.あなたは眠れなくなったので羊の数を数えることにしました。羊の数 n が与えられ
# 羊が1匹 羊が2匹 羊が3匹 ...
# と、n 回羊の数えを出力する関数 sheep
def sheep(n)
    count = 0
    while count < n
        count += 1
        puts "羊が#{count}匹"
    end
end

sheep(3)

# 3. 1 から 100 までの足し算の結果を出力する関数 sum_1_100
def sum_1_100
    sum = 0
    for num in 1..100 do 
        sum += num
    end
    puts sum
end

sum_1_100()

# 4. 2つの整数 x と y が与えられ、x から y までの足し算の結果を出力する関数 sum
def sum (x, y)
    sum = 0
    for num in x..y do
        sum += num
    end
    puts sum
end

sum(10, 80)

# 5. フィボナッチ数列(advanced)
# 家のお手伝いを毎日継続すると、継続日数 n 日に応じて、その日にもらえるお小遣いの金額が増えていきます。
# お小遣いの金額は以下の条件に従ってもらうことができます。
# f(0) = 0 円 f(1) = 1 円 f(n) = f(n-1) + f(n-2) 円 (n ≧ 2)
# 整数 n に対して、n 日間お手伝いを継続した時のお小遣いの金額を算出する関数 fibonacci を定義してください。
def fibonacci(n)
    if n == 0
        puts 0
    elsif n == 1
        puts 1
    else
        puts f(n) 
    end  
    
end

def f(n)
    sum = 0
    if n == 0
        return 0
    elsif n == 1
        return 1
    else    
        sum = sum +f(n-1) + f(n-2)
    end
    return sum
end

fibonacci(0)
fibonacci(1)
fibonacci(2)
fibonacci(3)
fibonacci(4)
fibonacci(7)
fibonacci(30)