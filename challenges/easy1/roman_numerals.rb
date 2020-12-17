class Integer
  def to_roman
    self.digits.reverse.map { |digit| numeral(digit) }.join
  end
  
  private
  
  def numeral(n)
    n + 5
  end
end

p 7.to_roman