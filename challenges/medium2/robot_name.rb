class Robot
  attr_accessor :name
  @@names = []
  
  def initialize
    @name = random_name
    @@names << name
  end
  
  def reset
    self.name = random_name
  end
  
  private
  
  def random_name
    temp_name = (0..4).map.with_index do |_,i|
      i < 2 ? [*'A'..'Z'].sample : [*0...9].sample
    end
    if @@names.include?(temp_name.join)
      temp_name = temp_name.map(&:next)
    end
    temp_name.join
  end
end