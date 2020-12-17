class Luhn
  attr_reader :num
  
  def initialize(num)
    @num = num.to_i
  end
  
  def addends
    num.digits.map.with_index do |n, i|
      i.odd? ? ((n*2 > 9) ? (n*2) - 9 : n*2) : n
    end.reverse
  end
  
  def checksum
    addends.sum
  end
  
  def valid?
    (checksum % 10).zero?
  end
  
  def self.create(num)
    digit = 0
    loop do
      n = num.digits.reverse.push(digit).join.to_i
      return n if Luhn.new(n).valid?
      digit += 1
    end
  end
end
