# gem install fakerしてから使う
require 'faker'

puts Faker::Name.name
puts Faker::Address.full_address
puts Faker::PhoneNumber.phone_number
puts Faker::Internet.email