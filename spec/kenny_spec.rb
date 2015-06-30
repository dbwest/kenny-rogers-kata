require 'spec_helper'
require_relative '../kenny'

describe Kenny do


  describe 'high card' do

    it 'determines that the higher pair wins' do
      high_card_hand = %w(1h 2h 3h 4s 7h)
      higher_card_hand = %w(1h 2h 3h 4s 8h)

      expect(subject.compare(high_card_hand, higher_card_hand)).to eq -1
      expect(subject.compare(higher_card_hand, high_card_hand)).to eq 1
    end

  end

  describe 'one pair' do
    it 'determines that a pair wins over high card' do
      high_card_hand = %w(1h 2h 3h 4s 7h)
      pair_hand = %w(2c 2h 3h 4s 7h)

      expect(subject.compare(high_card_hand, pair_hand)).to eq -1
    end

    it 'determines that the higher pair wins' do
      pair_hand = %w(2c 2h 3h 4s 7h)
      better_pair_hand = %w(3s 3d 5h 4s 7h)

      expect(subject.compare(pair_hand, better_pair_hand)).to eq -1
    end

    it 'determines that a pair loses flush' do
      pair_hand = %w(2s 2h 3h 4s 7h)
      flush_hand = %w(2c 1c 3c 4c 7c)

      expect(subject.compare(pair_hand,flush_hand)).to eq -1
    end
  end

  it 'determines that two pair wins over a pair' do
    two_pair_hand = %w(2h 2h 3h 3s 7h)
    pair_hand = %w(2c 2h 3h 4s 7h)

    expect(subject.compare(two_pair_hand, pair_hand)).to eq 1
  end

end