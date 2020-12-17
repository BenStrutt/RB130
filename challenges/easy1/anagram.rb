class Anagram
  def initialize(text)
    @text = text.downcase
  end
  
  def match(arr)
    arr.select do |word|
      word = word.downcase
      word.each_char.sort == text.each_char.sort && word != text
    end
  end
  
  private
  
  attr_reader :text
end