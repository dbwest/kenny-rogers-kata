class Hand
  def initialize hand
    @hand = hand
  end

  def flush?
    @hand.map{|card| card[1]}.uniq.length == 1
  end
end