class SumOfMultiples
  def initialize(*args)
    @multiples = args
  end
  
  def self.to(limit)
    self.new(3, 5).to(limit)
  end
  
  def to(limit)
    list = []
    multiples.each do |multiple|
      count = 1
      val = multiple
      until val >= limit
        list << val unless list.include?(val)
        count += 1
        val = multiple * count
      end
    end
    list.sum
  end
  
  private
  
  attr_reader :multiples
end