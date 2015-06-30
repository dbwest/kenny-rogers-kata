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

end
