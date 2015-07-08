require 'spec_helper'
require_relative '../hand'

describe Hand do
  describe "flush?" do

    it 'determines a flush is a flush' do
      hand = Hand.new(%w(1h 2h 6h 7h 8h))

      expect(hand.flush?).to be true
    end

    it 'tells you when you do not have a flush' do
      hand = Hand.new(%w(1h 2h 6h 7h 8s))

      expect(hand.flush?).to be false
    end

  end
  describe "pair?" do
    it 'determines when you have a pair' do
      hand = Hand.new(%w(1h 1h 2s 3s 4d))

      expect(hand.pair?).to be true
    end
    it 'does not count a three of a kind is a pair' do
      hand = Hand.new(%w(1h 1s 1c 2d 3c 6d))

      expect(hand.pair?).to be false
    end
    it 'does not count a full house as a pair' do
      pending
    end
    it 'does not count two pair as a pair' do
      hand = Hand.new(%w(1h 1c 2d 2s 7c))

      expect(hand.pair?).to be false
    end
  end

end
