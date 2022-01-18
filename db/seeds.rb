# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#デフォルトのタグを記述しています
Tag.create([
  { name: 'ランチ' },
  { name: '和食' },
  { name: '洋食' },
  { name: 'イタリアン' },
  { name: '中華' }
])