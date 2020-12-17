class RailFenceCipher
  def self.encode(str, size)
    code(str, size).map { |rail| rail.join.gsub('.', '') }.join
  end
  
  def self.decode(str, size)
    rails = code(str, size).map { |r| r.select { |c| c != '.' } }
    str = str.chars
    rails.map! { |r| r.map { |_| str.shift } }
    result = ""
    current = 0
    direction = 1
    until rails.all? { |rail| rail.empty? }
      result << (rails[current].shift)
      next if size == 1
      current = current + direction
      if current < 0 || current > size - 1
        direction *= -1
        current = current + (direction * 2)
      end
    end
    result
  end
  
  private
  
  def self.code(str, size)
    rails = Array.new(size) { [] }
    current = 0
    direction = 1
    str.chars.each do |c|
      rails.each_with_index do |rail, i|
        rail << (current == i ? c : '.')
      end
      next if size == 1
      current = current + direction
      if current < 0 || current > size - 1
        direction *= -1
        current = current + (direction * 2)
      end
    end
    rails
  end
end