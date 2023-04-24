# 従業員の名前がID順に配列で渡されるので、IDと従業員の名前をセットにして出力する print_names
def print_names(names)
    names.each.with_index(1) do|name, id|
        puts "#{id}. #{name}"
    end

end

print_names(['上田', '田仲', '堀田'])

# 2. map
# 与えられた整数の配列の要素を2乗した配列を返す square 関数を定義してください。なお、map メソッドを使うようにしてください。
def square(numbers)
    numbers.map do |number|
        number ** 2
    end
end

squared_numbers = square([5, 7, 10])
p squared_numbers



# 3. select
# 整数の配列から偶数を抽出した配列を返す関数 select_even_numbers

def select_even_numbers(numbers)
    new_number = numbers.select do |number|
        number if number % 2 == 0
    end
    return new_number
end

even_numbers = select_even_numbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
p even_numbers