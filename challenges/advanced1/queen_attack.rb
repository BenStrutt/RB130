class Queens
  attr_reader :white, :black
  
  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = white
    @black = black
  end
  
  def to_s
    (0..7).map do |c|
      (0..7).map do |r|
        [c, r] == white ? 'W' : [c, r] == black ? 'B' : '_'
      end.join(' ')
    end.join("\n")
  end
  
  def attack?
    [*-1..1].repeated_permutation(2).each do |dir|
      next if dir == [0,0]
      temp = white.clone
      while (0..7).include?(temp[0]) && (0..7).include?(temp[1])
        temp.map!.with_index { |coord, i| coord + dir[i] }
        return true if temp == black
      end
    end
    false
  end
end