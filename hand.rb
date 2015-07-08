class Hand
  def initialize hand
    @hand = hand
  end

  def flush?
    suits.uniq.length == 1
  end

  def suits
    @hand.map { |card| card[1] }
  end

  def ranks
    @hand.map { |card| card[0] }
  end

  def pair?
    (greatest_kind == 2) && (freq_dist(@hand).values.count(greatest_kind) == 1)
  end

  def freq_dist arr
    arr.inject(Hash.new(0)){|hsh,n| hsh[n] += 1 ; hsh }
  end

  def greatest_kind
    freq_dist(ranks).values.max
  end

end