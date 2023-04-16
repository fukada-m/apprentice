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
#   def initialize(manufacturer_name)
#     @manufacturer_name = manufacturer_name
#   end

#   def press_button
#     "cider"
#   end

#   def press_manufacturer_name
#     @manufacturer_name
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

#     def initialize(manufacturer_name)
#       @manufacturer_name = manufacturer_name
#       @total_coin = 0
#     end
  
#     def press_button
#         # 100円以上の時のみサイダーを出す
#         if @total_coin >= 100
#             @total_coin -= 100
#             return "cider"
#         end
#     end
    
#     private def press_manufacturer_name
#         @manufacturer_name
#     end

#     def deposit_coin(coin)
#         # 100円以外入れられない
#         if coin == 100
#             @total_coin += 100
#         end
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

class VendingMachine
    attr_accessor :total_coin
    def initialize(manufacturer_name)
      @manufacturer_name = manufacturer_name
      @total_coin = 0
    end
  # 自動販売機の責務はボタンが押されたら飲み物を排出する
    def press_button(item)
      # tmp = 0
      if item.drink_name == "cola" && total_coin >= 150
        tmp = total_coin - 150
        total_coin = tmp
        "cola"
      elsif item.drink_name == "サイダー" && total_coin >= 100
          tmp = total_coin -100
          total_coin -= 100
          "cider"
        end
    end
    
    private def press_manufacturer_name
        @manufacturer_name
    end

    def deposit_coin(coin)
        # 100円以外入れられない
        if coin == 100
            @total_coin += 100
        end
    end

  end

  class Item
    attr_reader :drink_name

    def initialize(drink_name)
      @drink_name = drink_name
    end
  end

  cola = Item.new('cola')
  vending_machine = VendingMachine.new('サントリー')
  vending_machine.deposit_coin(100)
  puts vending_machine.press_button(cola)
  vending_machine.deposit_coin(100)
  puts vending_machine.press_button(cola)

# サンプルアウトプット
  # 150円が貯まっていないので空文字が出力されます
# cola


# 5. 継承
# 自動販売機プログラムで以下の仕様変更がありました。
# カップコーヒー（カップに注ぐコーヒー）のアイスとホットも選択できるようにします。値段はどちらも100円です
# カップの在庫管理も行ってください。カップコーヒーが一つ注文されるとカップも在庫から一つ減ります。自動販売機が保持できるカップ数は最大100個とします
# カップを追加できるようにしてください


# 6. ポリモーフィズム
# 自動販売機プログラムにスナック菓子を追加しましょう。下記の仕様を追加します。
# ボタンを押すとポテトチップスが出るようにしましょう。ポテトチップスは150円とします。スナック菓子用のクラスを新規に作ることで対応してください。