require './suica'
require './vending_machine'

vending_machine = VendingMachine.new

p 'ステップ2'
puts "\n"

p '初期状態で、ペプシ(150円)を5本格納している'
puts vending_machine.juice_inventory
puts "\n"

p '自動販売機は在庫を取得できる'
puts vending_machine.juice_inventory
puts "\n"
