class Prime
  def self.nth(n)
    raise ArgumentError if n < 1
    count = 0
    result = 2
    loop do
      count += 1 if prime?(result)
      break if count == n
      result += 1
    end
    result
  end
  
  def self.prime?(n)
    2.upto(Math.sqrt(n)) { |i| return false if n % i == 0 }
    true
  end
end