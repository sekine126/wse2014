# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#
# 食材の追加
#

# カテゴリー：肉
Food.create(:category => 1, :name => '牛モモかたまり')
Food.create(:category => 1, :name => '牛モモスライス')

# カテゴリー：魚介
Food.create(:category => 2, :name => 'あさり')
Food.create(:category => 2, :name => 'あじ')




