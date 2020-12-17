class PerfectNumber
  def self.classify(n)
    raise StandardError.new if n < 1
    sum = find_divisors(n).sum
    case
    when sum < n then 'deficient'
    when sum > n then 'abundant'
    else 'perfect'
    end
  end
  
  private
  
  def self.find_divisors(n)
    (1...n).select { |m| (n % m).zero? }
  end
end