require './suica'
require './vending_machine'

suica = Suica.new
vending_machine = VendingMachine.new

puts 'ステップ3'
puts "\n"

p '自動販売機はペプシが購入できるかどうかを取得できる'
puts vending_machine.can_buy_juice?('ペプシ')
puts "\n"

p 'ジュース値段以上のチャージ残高がある条件下で購入操作を行うと以下の動作をする'
puts "購入前の在庫:#{vending_machine.juice_inventory}"
puts "購入前の残高:#{suica.balance}"
puts "購入前の売上:#{vending_machine.earnings}"
puts "\n"

puts vending_machine.purchase_juice(suica, 'ペプシ')
p '自動販売機はジュースの在庫を減らす'
p '売上金額を増やす'
p 'Suicaのチャージ残高を減らす'
puts "\n"

puts "購入後の在庫:#{vending_machine.juice_inventory}"
puts "購入後の売上:#{vending_machine.earnings}"
puts "購入後の残高:#{suica.balance}"
puts "\n"

p 'チャージ残高が足りない場合もしくは在庫がない場合、購入操作を行った場合は例外を発生させる'
p '残高が足りない場合'
puts "現在の残高:#{suica.balance}"
puts vending_machine.purchase_juice(suica, 'ペプシ')
puts vending_machine.purchase_juice(suica, 'ペプシ')
puts vending_machine.purchase_juice(suica, 'ペプシ')
puts "\n"

p '在庫が足りない場合'
suica.charge(1000)
puts "現在の在庫:#{vending_machine.juice_inventory}"
puts vending_machine.purchase_juice(suica, 'ペプシ')
puts vending_machine.purchase_juice(suica, 'ペプシ')
puts vending_machine.purchase_juice(suica, 'ペプシ')
puts "\n"

p '自動販売機は現在の売上金額を取得できる'
puts "現在の売上:#{vending_machine.earnings}"
puts "\n"
