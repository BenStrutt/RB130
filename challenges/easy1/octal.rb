class Octal
  def initialize(n)
    @digits = n.each_char.map(&:to_i)
    @octal = n =~ /^[0-7]+$/
  end
  
  def to_decimal
    return 0 unless @octal
    digits.reverse.map.with_index { |n, i| n * (8 ** i) }.sum
  end
  
  private
  
  attr_reader :digits
end