# 1. クラスの定義
# 自動販売機のクラス VendingMachine を宣言してください
# ボタンを押すとサイダーが出るようにします。press_button メソッドを実行すると 'cider' の文字列を返してください
 
# class VendingMachine
#   def press_button
#     "cider"
#   end
# end

# # サンプル呼び出し
# vending_machine = VendingMachine.new
# puts vending_machine.press_button



# 2. initializeメソッド
# 自動販売機のプログラムに initialize メソッド を追加しましょう。下記の仕様を追加します。
# オブジェクトの生成時に自動販売機のメーカー名を記録できるように、initialize メソッドを追加します
# 自動販売機のメーカー名確認ボタンを押すと、メーカー名を返す press_manufacturer_name メソッドを追加する

# class VendingMachine
#   attr_reader :manufacturer_name
#   def initialize(manufacturer_name)
#     @manufacturer_name = manufacturer_name
#   end

#   def press_button
#     "cider"
#   end

#   def press_manufacturer_name
#     manufacturer_name
#   end
# end

# # サンプル呼び出し
# vending_machine = VendingMachine.new('サントリー')
# puts vending_machine.press_manufacturer_name




# 3. メソッドの可視性
# 自動販売機のプログラムのメソッドに可視性を追記します。下記の仕様を追加します。
# コインを入れることのできる deposit_coin メソッドを作成します。100円以外のコインは入れられず、100円コインが入れられると自動販売機に金額が貯まります
# 100円以上貯まった状態でボタンを押すとサイダーが出るようにします。サイダーが出ると入れた金額から100円が減ります
# press_manufacturer_name メソッドは外部に公開しない非公開メソッドにしてください。private キーワードを使用します

# class VendingMachine
#   attr_accessor :deposit
#   attr_reader :manufacturer_name

#     def initialize(manufacturer_name)

#       @manufacturer_name = manufacturer_name
#       @deposit = 0
#     end
  
#     # サイダーを出す
#     def press_button
#         # depositが100円以上の時のみサイダーを出す
#         if deposit >= 100
#           calc_deposit(-100)
#           "cider"
#         end
#     end
    
#     private def press_manufacturer_name
#         manufacturer_name
#     end

#     # コインを入れる
#     def deposit_coin(coin)
#         # 100円以外入れられない
#         if coin == 100
#           calc_deposit(coin)
#         end
#     end

#     #ディポジットを計算する 
#     def calc_deposit(value)
#       self.deposit += value
#     end

#   end


# # サンプル呼び出し
# vending_machine = VendingMachine.new('サントリー')
# puts vending_machine.press_button

# vending_machine.deposit_coin(150)
# puts vending_machine.press_button

# vending_machine.deposit_coin(100)
# puts vending_machine.press_button

# puts vending_machine.press_manufacturer_name



# 4. 単一責任の原則
# 自動販売機プログラムを単一責任の原則に基づいて設計しましょう。下記の仕様を追加します。
# 押したボタンに応じて、サイダーかコーラが出るようにしましょう。サイダーは100円、コーラは150円とします。100円以外のコインは入れられない仕様はそのままです
# 自動販売機に関する責務とアイテムに関する責務は別のものになります。単一責任の原則に基づいてクラスを設計してください。

# 飲み物を出すことに対して責任を持つ
# class VendingMachine
#     attr_accessor :deposit

#     def initialize(manufacturer_name)
#       @manufacturer_name = manufacturer_name
#       @deposit = 0
#     end

#   # ボタンが押されたら飲み物を排出する
#     def press_button(item)
#       if check_deposit(item)
#         calc_deposit(-(item.price))
#         item.drink_name
#       end
#     end
    
#     # ディポジットが商品価格以上かチェックする
#     def check_deposit(item)
#       if self.deposit > item.price
#         true
#       else
#         false
#       end
#     end
    

#     # お金を入れたらチェックして貯める
#     def deposit_coin(coin)
#       if check_coin(coin)
#         calc_deposit(coin)
#       end
#     end
    
#     # 投入されたコインを確認する
#     def check_coin(coin)
#       if coin == 100
#         true
#       else
#         false  
#       end
#     end
    
#     #ディポジットを計算する 
#     def calc_deposit(value)
#       self.deposit += value
#     end
    
#     private def press_manufacturer_name
#         @manufacturer_name
#     end
#   end

# # 商品の名前と価格に対して責任を持つ
# class Item
#   attr_reader :drink_name, :price

#   def initialize(drink_name)
#     @drink_name = drink_name
#     @price = set_price(drink_name)
#   end

#   # 商品名に対応する価格を返す
#   def set_price(drink_name)
#     case drink_name
#     when "cola"
#       150

#     when "cider"
#       100
#     end
#   end

# end

#   cola = Item.new('cola')
#   vending_machine = VendingMachine.new('サントリー')
#   vending_machine.deposit_coin(100)
#   puts vending_machine.press_button(cola)
#   vending_machine.deposit_coin(100)
#   puts vending_machine.press_button(cola)

# サンプルアウトプット
  # 150円が貯まっていないので空文字が出力されます
# cola



# 5. 継承
# 自動販売機プログラムで以下の仕様変更がありました。
# カップコーヒー（カップに注ぐコーヒー）のアイスとホットも選択できるようにします。値段はどちらも100円です
# カップの在庫管理も行ってください。カップコーヒーが一つ注文されるとカップも在庫から一つ減ります。自動販売機が保持できるカップ数は最大100個とします
# カップを追加できるようにしてください

# # 飲み物を出すことに対して責任を持つ
# class VendingMachine
#   attr_accessor :deposit, :cup

#   def initialize(manufacturer_name)
#     @manufacturer_name = manufacturer_name
#     @deposit = 0
#     @cup = 0
#   end

# # 飲み物を排出する
#   def press_button(item)
#     if check_deposit(item)
#       if is_coffee(item)
#         if self.cup > 0
#           sub_cup(1)
#         else
#           return
#         end
#       end
#       calc_deposit(-(item.price))
#       item.drink_name
#     end
#   end
  


#   # ディポジットが商品価格以上かチェックする
#   def check_deposit(item)
#     true if self.deposit >= item.price
#   end

#   # カップの個数を加算する
#   def add_cup(number)
#     self.cup += number
#   end
#   #カップの数を減らす 
#   def sub_cup(number)
#     self.cup -= number
#   end

#     # コーヒーかどうか確認する
#   def is_coffee(item)
#     true if item.tag == "coffee" 
    
#   end

#   # お金を入れたらチェックして貯める
#   def deposit_coin(coin)
#     calc_deposit(coin) if check_coin(coin)
#   end
  
#   # 投入されたコインが100円か確認する
#   def check_coin(coin)
#     true if coin == 100
#   end
  
#   #ディポジットを計算する 
#   def calc_deposit(value)
#     self.deposit += value
#   end
  
#   private def press_manufacturer_name
#       @manufacturer_name
#   end
# end



# # 商品の名前と価格に対して責任を持つ
# class Item
#   attr_reader :drink_name, :price, :tag

#   def initialize(drink_name)
#     @drink_name = drink_name
#     @price = set_price(drink_name)
#     @tag = nil
#   end

#   # 商品名に対応する価格を返す
#   def set_price(drink_name)
#   end

# end

# # コーラとサイダーがある
# class Drink < Item
#   def set_price(drink_name)
#     case drink_name
#     when "cola"
#       150
#     when "cider"
#       100
#     end
#   end

# end

# # ホットとアイスがある
# class CupCoffee < Item

#   def initialize(drink_name)
#     super
#     @tag = "coffee"
#   end

#   def set_price(drink_name)
#     case drink_name
#     when "hot", "ice"
#       100
#     end
#   end

# end


# # press_button メソッドを実行すると、与えられた引数に応じた飲み物を返してください。

# hot_cup_coffee = CupCoffee.new('hot')
# cider = Drink.new('cider')
# vending_machine = VendingMachine.new('サントリー')
# vending_machine.deposit_coin(100)
# vending_machine.deposit_coin(100)
# puts vending_machine.press_button(cider)

# puts vending_machine.press_button(hot_cup_coffee)
# vending_machine.add_cup(1)
# puts vending_machine.press_button(hot_cup_coffee)
# ▼サンプルアウトプット
# cider
# カップが貯まっていないので空文字が出力されます
# hot cup coffee



# 6. ポリモーフィズム
# 自動販売機プログラムにスナック菓子を追加しましょう。下記の仕様を追加します。
# ボタンを押すとポテトチップスが出るようにしましょう。ポテトチップスは150円とします。スナック菓子用のクラスを新規に作ることで対応してください。



# 飲み物を出すことに対して責任を持つ
class VendingMachine
  attr_accessor :deposit, :cup

  def initialize(manufacturer_name)
    @manufacturer_name = manufacturer_name
    @deposit = 0
    @cup = 0
  end

# 飲み物を排出する
  def press_button(item)
    if check_deposit(item)
      if is_coffee(item)
        if self.cup > 0
          sub_cup(1)
        else
          return
        end
      end
      calc_deposit(-(item.price))
      item.name
    end
  end
  


  # ディポジットが商品価格以上かチェックする
  def check_deposit(item)
    true if self.deposit >= item.price
  end

  # カップの個数を加算する
  def add_cup(number)
    self.cup += number
  end
  #カップの数を減らす 
  def sub_cup(number)
    self.cup -= number
  end

    # コーヒーかどうか確認する
  def is_coffee(item)
    true if item.tag == "coffee" 
    
  end

  # お金を入れたらチェックして貯める
  def deposit_coin(coin)
    calc_deposit(coin) if check_coin(coin)
  end
  
  # 投入されたコインが100円か確認する
  def check_coin(coin)
    true if coin == 100
  end
  
  #ディポジットを計算する 
  def calc_deposit(value)
    self.deposit += value
  end
  
  private def press_manufacturer_name
      @manufacturer_name
  end
end



# 商品の名前と価格に対して責任を持つ
class Item
  attr_reader :name, :price, :tag

  def initialize(name)
    @name = name
    @price = set_price(name)
    @tag = nil
  end

  # 商品名に対応する価格を返す
  def set_price(name)
  end

end

# コーラとサイダーがある
class Drink < Item
  def set_price(name)
    case name
    when "cola"
      150
    when "cider"
      100
    end
  end

end

# コーヒーにはホットとアイスがある
class CupCoffee < Item

  def initialize(name)
    super
    @tag = "coffee"
  end

  def set_price(name)
    case name
    when "hot", "ice"
      100
    end
  end

end

class Snack < Item
  def initialize
    @name = "potato chips"
    @price = 150
  end
end



# ▼サンプル呼び出し

hot_cup_coffee = CupCoffee.new('hot');
cider = Drink.new('cider')
snack = Snack.new
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)

puts vending_machine.press_button(hot_cup_coffee)
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee)

puts vending_machine.press_button(snack)
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(snack)



# ▼サンプルアウトプット
# cider
#  # カップが貯まっていないので空文字が出力されます
# hot cup coffee
#  # お金が貯まっていないので空文字が出力されます
# potato chips
# ▼回答例_Ruby

# class VendingMachine
#   # クラスを完成させてください
# end

# class # アイテムに関する責務のクラスを作成してください
# end

# # 飲み物に関する責務のクラスを継承を利用して作成してください
# class #{飲み物クラス} < #{アイテムクラス} 
# end

# # カップコーヒーに関する責務のクラスを継承を利用して作成してください
# class #{カップコーヒークラス} < #{アイテムクラス} 
# end

# # スナック菓子に関する責務のクラスを継承を利用して作成してください
# class #{スナック菓子クラス} < #{アイテムクラス} 
# end