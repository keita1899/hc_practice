require './juice'

class VendingMachine
  def initialize
    @juice_inventory = []

    # 自動販売機はジュースを１種類格納できる
    add_juice_inventory('ペプシ', 150, 5)

    @earnings = 0
  end

  def juice_inventory
    available_list.map do |juice_name|
      "#{juice_name} #{count_juice(juice_name)}本"
    end
  end

  def earnings
    @earnings
  end

  def can_buy_juice?(juice_name)
    count_juice(juice_name).positive? ? '購入できる' : '売り切れ'
  end

  def purchase_juice(suica, juice_name)
    target_juice = @juice_inventory.find { |juice| juice.name == juice_name }

    begin
      if target_juice
        if suica.balance >= target_juice.price
          delete_juice_inventory(juice_name, 1)
          increase_earnings(target_juice.price)
          suica.pay(target_juice.price)
          "#{juice_name}購入"
        else
          raise '残高が足りません'
        end
      else
        raise '在庫がありません'
      end
    rescue StandardError => e
      e.message
    end
  end

  def available_list
    @juice_inventory.uniq(&:name).map(&:name)
  end

  def add_juice_inventory(juice_name, price, amount)
    amount.times do
      @juice_inventory << Juice.new(juice_name, price)
    end
    "#{juice_name}#{amount}本補充"
  end

  private

  def increase_earnings(amount)
    @earnings += amount
  end

  def count_juice(juice_name)
    @juice_inventory.count { |juice| juice.name == juice_name }
  end

  def delete_juice_inventory(juice_name, amount)
    if count_juice(juice_name) >= amount
      amount.times do
        index = @juice_inventory.index { |juice| juice.name == juice_name }
        @juice_inventory.delete_at(index)
      end
    else
      '削除できません'
    end
  end
end
