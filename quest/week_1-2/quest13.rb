# Q.例外とは何か
# A.例外とは、プログラムの実行中にエラーが発生したことを示すオブジェクトのことです
# Q.何のためにあるのか
# A.エラーを検知し、プログラムの実行を継続するためにある

# num1、num2、operatorの3つのパラメータを受け取るcalculateという関数を作成する
def calculate(num1, num2, operator)
    if num1 == num1.to_i && num2 == num2
        num1 = num1.to_i
        num2 = num2.to_i
        case operator
        when "*"
            num1 * num2
        when "/"
            num1 / num2
        when "+"
            num1 + num2
        when "-"
            num1 + num2
        else raise "演算子には　+、-、*、/のいずれかを使用してください"
        end
    else
        raise "num1、num2には整数を入力してください"
    end
end

# サンプル呼び出し
# calculate(1, 0, '/')
# calculate(1.5, 2, '+')
# calculate(1.5, 2, '**')
# calculate(5, 2, '*')

  
  puts "1番目の整数を入力してください:"
  num1 = gets.chomp.to_f
  
  puts "2番目の整数を入力してください:"
  num2 = gets.chomp.to_f
  
  puts "演算子(+, -, *, /)を入力してください:"
  operator = gets.chomp
  
  begin
    result = calculate(num1, num2, operator)
    puts result
  rescue ZeroDivisionError => e
    puts "0による割り算は許可されていません"
  end