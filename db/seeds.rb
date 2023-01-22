# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

##タグ
Tag.create([
    { tag_name: 'スマートフォン' },
    { tag_name: 'タブレット端末' },
    { tag_name: 'イヤホン/ヘッドホン'},
    { tag_name: 'ケーブル類'},
    { tag_name: 'パソコン/ノートPC'},
    { tag_name: 'モニター'},
    { tag_name: 'キーボード'},
    ])