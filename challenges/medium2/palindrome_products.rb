class Palindromes
  def initialize(max_factor:, min_factor: 1)
    @max = max_factor
    @min = min_factor
  end
  
  def generate
    palindromes = []
    min.upto(max) do |n|
      min.upto(max) do |m|
        palindromes << Palindrome.new(n * m, min, max) if palindrome?(n * m)
      end
    end
    self.palindromes = palindromes
  end
  
  def largest
    palindromes.max
  end
  
  def smallest
    palindromes.min
  end
  
  private
  
  def palindrome?(number)
    number.digits == number.digits.reverse
  end
  
  attr_reader :max, :min
  attr_accessor :palindromes
end

class Palindrome
  include Comparable
  
  def initialize(num, min, max)
    @num = num
    @min = min
    @max = max
  end
  
  def value
    num
  end
  
  def factors
    factors = []
    floor = Math.sqrt(num).floor
    floor.upto(max) { |n| factors << [num / n, n] if num % n == 0 }
    factors
  end
  
  protected
  
  attr_reader :num
  
  private
  
  attr_reader :min, :max
  
  def <=>(other)
    num <=> other.num
  end
end

palindromes = Palindromes.new(max_factor: 99, min_factor: 10)
palindromes.generate
smallest = palindromes.smallest
p smallest.value