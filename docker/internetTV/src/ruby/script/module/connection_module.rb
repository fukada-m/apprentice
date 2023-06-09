# frozen_string_literal: true

# DBと接続するメソッドです。
module ConnectionModule
  def conn
    PG.connect(
      host: 'postgres',
      port: 5432,
      user: 'fukada',
      password: 'yami',
      dbname: 'internet_tv'
    )
  end
end
