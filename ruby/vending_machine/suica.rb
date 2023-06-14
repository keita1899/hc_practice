class Suica
  DEPOSIT = 500
  CHARGE_LIMIT = 100

  def initialize
    @balance = DEPOSIT
  end

  def balance
    @balance
  end

  def charge(amount)
    if amount >= CHARGE_LIMIT
      @balance += amount
      "#{amount}チャージ"
    else
      begin
        raise '100円未満はチャージできません'
      rescue StandardError => e
        e.message
      end
    end
  end

  def pay(amount)
    if @balance < amount
      @balance = 0
    else
      @balance -= amount
    end
  end
end
