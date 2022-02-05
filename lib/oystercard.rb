class Oystercard

    MAX_LIMIT = 90
attr_reader :balance
  def initialize
    @balance = 0
  end
 
  def top_up(amount)
    fail "Maximum balance is #{MAX_LIMIT}, please do not exceed this limit" if @balance + amount > MAX_LIMIT
        @balance += amount
  end

  def deduct(amount)
    @balance -= amount

  end

  def in_journey?
    false
  end

end