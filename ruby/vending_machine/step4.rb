require './suica'
require './vending_machine'

suica = Suica.new
vending_machine = VendingMachine.new

p 'ステップ4'
puts "\n"

p 'ジュースを3種類管理できるようにする。'
puts vending_machine.add_juice_inventory('モンスター', 230, 5)
puts vending_machine.add_juice_inventory('いろはす', 120, 5)
puts "現在の在庫:#{vending_machine.juice_inventory}"
puts "\n"

p '自動販売機は購入可能なドリンクのリストを取得できる'
puts vending_machine.available_list
puts "\n"

p '自動販売機に在庫を補充できるようにする'
puts "補充前の在庫:#{vending_machine.juice_inventory}"
puts "\n"

puts vending_machine.add_juice_inventory('ペプシ', 150, 1)
puts "\n"

puts "補充後の在庫:#{vending_machine.juice_inventory}"
puts "\n"

p 'ステップ3と同様の方法でモンスターといろはすを購入できる'
puts "購入前の在庫:#{vending_machine.juice_inventory}"
puts "\n"

puts vending_machine.purchase_juice(suica, 'モンスター')
puts vending_machine.purchase_juice(suica, 'いろはす')
puts vending_machine.purchase_juice(suica, 'いろはす')
puts "\n"

puts "購入後の在庫:#{vending_machine.juice_inventory}"
puts "\n"
