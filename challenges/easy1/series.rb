class Series
  attr_reader :arr
  
  def initialize(string)
    @arr = string.split('').map(&:to_i)
  end
  
  def slices(cons)
    raise ArgumentError.new if cons > arr.size
    
    result = []
    arr.each_cons(cons) { |*args| result << args.first }
    result
  end
end