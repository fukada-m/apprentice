class My_class
    public
    def func_public
        puts "public"
    end

    def call_private
        func_private
    end 

    def call_protected
        func_protected
    end

    def call_private_instance(obj)
        obj.func_private
    end

    def call_protected_instance(obj)
        obj.func_protected
    end

    private

    def func_private
        puts "private"
    end

    protected

    def func_protected
        puts "protected"
    end

end

class My_subclass < My_class
    
end

my_class = My_class.new
my_subclass = My_subclass.new

# -------publicの特徴--------
my_subclass.func_public# => インスタンスから呼べる
# my_class.func_protected　=> インスタンスからは呼べない
# my_class.func_private => インスタンスからは呼べない

# -------privateとprotectedの呼び方-------
my_subclass.call_private
my_subclass.call_protected

# -------privateとprotectedの違い-----------
# サブクラスの中からならインスタンスを使ってプロテクテッドを呼べる
my_subclass.call_protected_instance(my_class)
# my_subclass.call_private_instance(my_class) =>サブクラスの中からはインスタンスを使ってプラベートは呼べない
#親クラスの中ならどちらもインスタンスを使って呼べる
my_class.call_protected_instance(my_class)
#親クラスの中ならどちらもインスタンスを使って呼べる
my_class.call_protected_instance(my_class)