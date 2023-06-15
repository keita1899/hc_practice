require './suica'
require './vending_machine'

suica = Suica.new

p 'ステップ1'
puts "\n"

p '預かり金(デポジット)として500円がデフォルトでチャージされているものとする'
puts "インスタンス化直後の残高:#{suica.balance}"
puts "\n"

p 'Suicaには100円以上の任意の金額をチャージできる'
puts suica.charge(100)
puts "現在の残高:#{suica.balance}"
puts "\n"

p '100円未満をチャージしようとした場合は例外を発生させる'
puts suica.charge(99)
puts "現在の残高:#{suica.balance}"
puts "\n"

p 'Suicaは現在のチャージ残高を取得できる'
puts "現在の残高:#{suica.balance}"
