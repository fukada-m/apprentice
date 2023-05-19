require 'pg'

conn = PG.connect(
  host: 'postgres', # PostgreSQLサービスのコンテナ名を指定します。
  port: 5432, # PostgreSQLのデフォルトポート番号
  user: 'fukada',
  password: 'yami',
  dbname: 'internet_tv'
)

result = conn.exec("SELECT * FROM genres")

result.each do |row|
    # puts "ID: #{row['id']}, Name: #{row['name']}"
    puts "#{row['genre']}"

end
conn.close

# 読み込んだファイルの1行目が合ってるかテストするコード
def file_read_test(txt)
    File.open(txt, 'r') do |f|
         f.gets
    end
end


def file_read(txt)
    File.open(txt, 'r') do |f|
        f.read
   end
end

file_read('./ruby/sql/create_table.sql')
file_read('./ruby/sql/insert_channel_and_genre.sql')
file_read('./ruby/sql/insert_anime_data.sql')