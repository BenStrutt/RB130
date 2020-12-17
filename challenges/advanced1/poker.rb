require 'pry'

class Poker
  def initialize(hands)
    @hands = hands.map { |hand| PokerHand.new(hand) }
  end
  
  def best_hand
    hands_ = hands.select { |hand| hand == hands.max }
    hands_.map(&:to_a)
  end
  
  private
  
  attr_reader :hands
end

class PokerHand
  include Comparable
  include Enumerable
  
  def initialize(hand)
    @hand = hand.map { |card| Card.new(card) }
  end
  
  def to_a
    hand.map { |card| card.get_rank + card.suit }
  end
  
  def each
    hand.each { |card| yield card }
  end
  
  protected
  
  def value
    hands = [
      'high_card', 'one_pair', 'two_pair', 'three_of_a_kind', 'straight',
      'flush', 'full_house', 'four_of_a_kind', 'straight_flush',
    ]
    hands.index(poker_hand)
  end
  
  def poker_hand
    case
    when straight_flush? then 'straight_flush'
    when four_of_a_kind? then 'four_of_a_kind'
    when full_house? then 'full_house'
    when flush? then 'flush'
    when straight? then 'straight'
    when three_of_a_kind? then 'three_of_a_kind'
    when two_pair? then 'two_pair'
    when one_pair? then 'one_pair'
    else 'high_card'
    end
  end
  
  def straight_flush?
    straight? && flush?
  end
  
  def four_of_a_kind?
    kinds(4).size == 4
  end
  
  def full_house?
    three_of_a_kind? && one_pair?
  end
  
  def flush?
    hand.all? { |card| card.suit == hand.first.suit }
  end
  
  def straight?
    hand_ = hand.map { |card| card.rank }.sort
    if hand_.any? { |rank| rank == 2 }
      hand_ = hand_.map { |rank| rank == 14 ? 1 : rank }.sort
    end
    hand_.each_cons(2) { |i,j| return false unless j - i == 1 }
    true
  end
  
  def three_of_a_kind?
    kinds(3).size == 3
  end
  
  def two_pair?
    kinds(2).size == 4
  end
  
  def one_pair?
    kinds(2).size == 2
  end
  
  def kinds(amt)
    hand.select { |card| hand.count { |c| c.rank == card.rank } == amt }
  end
  
  def compare_high_card(other)
    self.max <=> other.max
  end
  
  def compare_one_pair(other)
    hand1 = hand.partition { |card| hand.count { |c| c.rank == card.rank} == 2 }
    hand2 = other.hand.partition do |card|
      other.hand.count { |c| c.rank == card.rank} == 2
    end
    if hand1[0][0].rank == hand2[0][0].rank
      3.times do |i|
        unless hand1[1][i].rank == hand2[1][i].rank
          return hand1[1][i].rank <=> hand2[1][i].rank
        end
      end
      0
    else
      hand1[0][0].rank <=> hand2[0][0].rank
    end
  end
  
  def compare_two_pair(other)
    hand1 = hand.map { |card| card.rank }
    hand2 = other.hand.map { |card| card.rank }
    
    hand1 = hand1.partition do |card|
      hand.count { |c| c.rank == card} == 2
    end
    hand2 = hand2.partition do |card|
      other.hand.count { |c| c.rank == card} == 2
    end
    hand1[0], hand2[0] = hand1[0].sort.reverse, hand2[0].sort.reverse
    return hand1[0][0] <=> hand2[0][0] unless hand1[0][0] == hand2[0][0]
    return hand1[0][2] <=> hand2[0][2] unless hand1[0][2] == hand2[0][2]
    return hand1[1].first <=> hand2[1].first
  end
  
  def compare_three_of_a_kind(other)
    hand1 = hand.partition { |card| hand.count { |c| c.rank == card.rank} == 3 }
    hand2 = other.hand.partition do |card|
      other.hand.count { |c| c.rank == card.rank} == 3
    end
    if hand1[0][0].rank == hand2[0][0].rank
      2.times do |i|
        unless hand1[1][i].rank == hand2[1][i].rank
          return hand1[1][i].rank <=> hand2[1][i].rank
        end
      end
      0
    else
      hand1[0][0].rank <=> hand2[0][0].rank
    end
  end
  
  def compare_straight(other)
    card1 = hand.max { |i,j| i.rank <=> j.rank }
    card2 = other.hand.max { |i,j| i.rank <=> j.rank }
    card1.rank <=> card2.rank
  end
  
  def compare_flush(other)
    hand1 = hand.map(&:rank).sort
    hand2 = other.hand.map(&:rank).sort
    5.times { |i| return hand1[i] <=> hand2[i] unless hand1[i] == hand2[i] }
    0
  end
  
  def compare_full_house(other)
    hand1 = hand.partition { |card| hand.count { |c| c.rank == card.rank} == 3 }
    hand2 = other.hand.partition do |card|
      other.hand.count { |c| c.rank == card.rank} == 3
    end
    return hand1[0][0] <=> hand2[0][0] unless hand1[0][0] == hand2[0][0]
    hand1[1][0] <=> hand2[1][0]
  end
  
  def compare_four_of_a_kind(other)
    hand1 = hand.partition { |card| hand.count { |c| c.rank == card.rank} == 4 }
    hand2 = other.hand.partition do |card|
      other.hand.count { |c| c.rank == card.rank} == 4
    end
    return hand1[0][0] <=> hand2[0][0] unless hand1[0][0] == hand2[0][0]
    hand1[1][0] <=> hand2[1][0]
  end
  
  def compare_straight_flush(other)
    compare_straight(other)
  end
  
  
  attr_reader :hand
  
  private
  
  def <=>(other)
    if value == other.value
      self.send('compare_' + poker_hand, other)
    else
      value <=> other.value
    end
  end
end

class Card
  include Comparable
  
  attr_reader :rank, :suit
  
  def initialize(card)
    @rank = set_rank(card[0])
    @suit = card[1]
  end
  
  def get_rank
    ranks = %w(T J Q K A)
    rank < 10 ? rank.to_s : ranks[rank - 10]
  end
  
  def <=>(other)
    suits = %w(C D H S)
    (rank * 100) + (suits.index(suit)) <=>
    (other.rank * 100) + (suits.index(other.suit))
  end
  
  private
  
  def set_rank(rank)
    ranks = %w(T J Q K A)
    rank.to_i > 0 && rank.to_i < 10 ? rank.to_i : ranks.index(rank) + 10
  end
end