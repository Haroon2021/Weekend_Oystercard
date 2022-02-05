require './lib/oystercard.rb'

describe Oystercard do
  describe "#balance" do
    it "card has a balance" do
      expect(subject).to respond_to(:balance)
    end

    it "new oyster card has a 0 balance" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "Card should be able to top up" do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it "top_up(5) should increase balance by £5" do
      expect{ subject.top_up(5) }.to change{ subject.balance }.by (5)
    end

    it "should not top up more than the max balance" do
      maximum_balance = Oystercard::MAX_LIMIT 
      subject.top_up(maximum_balance)
      expect{ subject.top_up(1)}.to raise_error{'Maximum balance is #{MAX_LIMIT}, please do not exceed this limit'} 
    end
  end

  describe "#deduct" do
    it "oyster card should respond to deduct moeny" do
      expect(subject).to respond_to(:deduct).with(1).argument
    end

    it "should deduct money from the oyster card" do
      subject.top_up(20)
      expect{ subject.deduct(5)}.to change{ subject.balance}.by (-5)
    end

  end

  # describe "#in_journey?" do
    
  #   it "create an oyster card and check if its in journey, it should not be in journey" do
  #     #expect(subject.in_journey?).to eq false
  #     expect(subject).not_to be_in_journey
  #   end
  # end

  describe "#touch_in" do
    it "Oystercard can touch_in" do
      expect(subject).to respond_to(:touch_in)
    end

    it "Card is in_journey" do
      subject.top_up(5)
      expect(subject.touch_in).to eq true
    end

    it "can touch in" do
    subject.top_up(5)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it "can not touch in if limit below min_value" do
      expect{ subject.touch_in}.to raise_error{'insufficent funds please top up to have a min fare of at least #{MIN_LIMIT}'}
    end

  end

  describe "#touch_out" do
    it "Oystercard can touch_out" do
      expect(subject).to respond_to(:touch_out)
    end

    it "Card is not in_journey when you touch_out" do
      expect(subject.touch_out).to eq false
    end

    it "can touch out" do
      subject.top_up(5)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end

