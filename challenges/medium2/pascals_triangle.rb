class Triangle
  attr_reader :size, :triangle
  
  def initialize(size)
    @size = size
    @triangle = []
  end
  
  def rows
    return [[1]] if size == 1
    build_rows
    triangle
  end
  
  def last
    rows.last
  end
  
  private
  
  def build_rows(current = size)
    if current == 2
      triangle << [1]
      triangle << [1, 1]
      return [1, 1]
    end
    
    temp_row = [1]
    build_rows(current - 1).each_cons(2) do |*nums|
      temp_row << nums[0].sum
    end
    triangle << temp_row.push(1)
    temp_row
  end

end

p Triangle.new(4).rows.last