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
end