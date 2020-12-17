class Phrase
  def initialize(phrase)
    @phrase = phrase
  end
  
  def word_count
    arr = phrase.scan(/[A-Za-z]+(?:'[A-Za-z])?|[0-9]/).map(&:downcase)
    count = Hash.new(0)
    arr.each { |word| count[word] += 1 }
    count
  end
  
  private
  
  attr_reader :phrase
end
