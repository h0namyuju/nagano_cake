# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)

#会員データ
Customer.create!(
  first_name: '山田',
  last_name: '花子',
  first_name_kana: 'ヤマダ',
  last_name_kana: 'ハナコ',
  email: '123456@email.com',
  password: '111111',
  postal_code: '000-1111',
  address: '東京都渋谷区神南1丁目19−11 パークウェースクエア2 4階',
  telephone_number: '0368694700',
  is_deleted: '有効',
  )


Customer.create!(
  first_name: '越智',
  last_name: '穂乃果',
  first_name_kana: 'オチ',
  last_name_kana: 'ホノカ',
  email: '654321@email.com',
  password: '222222',
  postal_code: '000-2222',
  address: '東京都渋谷区神南1丁目19−11 マンション名2１階',
  telephone_number: '0900001111',
  is_deleted: '有効',
  )

# gem faker 会員ダミーデータ
