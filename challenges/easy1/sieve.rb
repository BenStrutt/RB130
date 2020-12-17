class Primes
  attr_reader :val
  attr_accessor :prime
  
  def initialize(n)
    @val = n
    @prime = true
  end
  
  def mark
    @prime = false
  end
end

class Sieve
  attr_reader :range
  
  def initialize(limit)
    arr = [*2..limit]
    @range = []
    arr.each { |n| @range << Primes.new(n) }
  end
  
  def primes
    start = 2
    loop do
      mark_multiples(start)
      start = find_next(start)
      break if start == nil
    end
    range.select { |n| n.prime == true }.map { |n| n.val }
  end
  
  def mark_multiples(n)
    counter = 2
    until n * counter > range.last.val
      range[(n * counter) - 2].mark
      counter += 1
    end
  end
  
  def find_next(start)
    range.each { |n| return n.val if n.val > start && n.prime == true }
    nil
  end
end

a = Sieve.new(10)
p a.primes