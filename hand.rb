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
    (greatest_kind == 2) && (histogram(@hand).values.count(greatest_kind) == 1)
  end

  def four_of_a_kind?
    histogram_counts = histogram(ranks).map {|k,v| v}
    histogram_counts.sort == [1,4]
  end

  def histogram arr
    arr.inject(Hash.new(0)){|hsh,n| hsh[n] += 1 ; hsh }
  end

  def greatest_kind
    histogram(ranks).values.max
  end

end