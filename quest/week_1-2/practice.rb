module My_extend_module
    def extend_method
        puts "エクステンドメソッド"
    end
end

module Class_module
    def extend_class_method
        puts"クラスメソッド"
    end
end

module Instance_module
    def include_instance_method
        puts "インスタンスメソッド"
    end
end

module Prepend_module
    def my_func
        puts "上書きしたmy_func"
    end
end

class My
    extend Class_module
    include Instance_module
    prepend Prepend_module
    def my_func
        puts "my_func"
    end
end

# クラスメソッド
My.extend_class_method
my = My.new
# インスタンスメソッド
my.include_instance_method

# インスタンスメソッドにモジュールを追加
my.extend(My_extend_module)
my.extend_method
# クラスメソッドにモジュールを追加
My.extend(My_extend_module)
My.extend_method

my.my_func