# 1. シンボル
# Rubyにおけるシンボルについて
# Q.シンボルとは何か
# A.文字列に似たデータ型で先頭に:をつけて表現するもの
# Q.文字列と何が違うのか
# A.イミュータブルであるため変更することはできない。シンボルクラスである
# シンボルがよく使われるのはどのような用途か
# A.識別ようの名前としてよく使われる。イミュータブルなためハッシュのキーとして使われる


# 2.両替
# 引数として金額、変換元の通貨、変換先の通貨を受け取り、変換後の金額を出力する両替関数を作成します。
# まず、米ドル（USD）に対するさまざまな通貨の換算率を格納した conversion_rates というハッシュを作成してください。
# キーには通貨名をシンボルで指定し、値には通貨の換算率を数値で格納してください。
# 次に、金額、変換元の通貨、変換先の通貨、返還率を受け取り、変換後の金額を出力する convert_currency 関数を作成してください。

def convert_currency(amount, source_currency, target_currency, conversion_rates)
    converted_amount = 0
    # 一度米ドルに変換する
    converted_amount = amount / conversion_rates[source_currency]
    #変換先が米ドルの場合はそのまま出力する
    if target_currency == :usd
        return puts converted_amount 
    end
    # それ以外の場合は再度変換先の通貨に変換する
    converted_amount = converted_amount * conversion_rates[target_currency]
    
    return puts converted_amount
  
end


conversion_rates = {
    usd: 1.0,
    jpy: 110.0,
    eur: 0.8
  }

convert_currency(100, :usd, :jpy, conversion_rates) # 100ドルを円に変換
convert_currency(1000, :jpy, :usd, conversion_rates) # 1000円を米ドルに変換
convert_currency(100, :jpy, :eur, conversion_rates) #100円をユーロに変換


