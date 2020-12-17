class Scrabble
  attr_reader :word
  
  SCORES = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }
  
  def initialize(word)
    if word.nil? || word.empty?
      @word = nil
    else
      begin
        @word = word.scan(/[A-Za-z]+/).first.upcase.split('')
      rescue NoMethodError
        @word = nil
      end
    end
  end
  
  def score
    return 0 if word.nil?
    word.map { |c| SCORES.select { |k,v| v.include?(c) }.keys[0] }.sum
  end
  
  def self.score(word)
    self.new(word).score
  end
end

p Scrabble.new('quirky').score