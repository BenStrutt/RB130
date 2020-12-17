class Trinary
  def initialize(n)
    @digits = n.each_char.map(&:to_i)
    @trinary = n =~ /^[0-2]+$/
  end
  
  def to_decimal
    return 0 unless @trinary
    digits.reverse.map.with_index { |n, i| n * (3 ** i) }.sum
  end
  
  private
  
  attr_reader :digits
end