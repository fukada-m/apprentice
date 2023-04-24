# gem install fakerしてから使う
require 'faker'

puts Faker::Name.name
puts Faker::Address.full_address
puts Faker::PhoneNumber.phone_number
puts Faker::Internet.email

# Q.Bundler が何のためにあるのか、
# - Gemのバージョンを一元管理する
# - 依存関係のアップデートを自動化
# - 必要なgemを一括でインストールできる