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
      subject.top_up(90)
      expect{ subject.top_up(1)}.to raise_error{'Maximum balance is #{MAX_LIMIT}, please do not exceed this limit'} 
    end

  end
end

