class Oystercard

    MAX_LIMIT = 90
    MIN_LIMIT = 1
    MIN_FARE = 1

attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    # @in_journey = false
    @entry_station = nil
  end
 
  def top_up(amount)
    fail "Maximum balance is #{MAX_LIMIT}, please do not exceed this limit" if @balance + amount > MAX_LIMIT
        @balance += amount
  end

 
  def in_journey?
    !!entry_station
  end

 
  def touch_in(station)
    fail "insufficent funds please top up to have a min fare of at least #{MIN_LIMIT}" if @balance < MIN_LIMIT
    # @in_journey = true
    @entry_station = station
  end

  def touch_out
    deduct(MIN_FARE)

     # @in_journey = false
     @entry_station = nil
  end

 private
 
  def deduct(amount)
    @balance -= amount
  end
end