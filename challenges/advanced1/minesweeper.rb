class ValueError < StandardError; end

class Board
  def self.transform(inp)
    raise ValueError unless valid?(inp)
    inp.map.with_index { |l, i| l == inp.first ? l : count(l, i, inp) }
  end
  
  def self.count(line, i, inp)
    line.chars.map.with_index do |c, j|
      c == '|' || c == '*' ? c : adjacent(i, j, inp)
    end.join
  end
  
  def self.adjacent(i, j, inp)
    count = [*-1..1].repeated_permutation(2).count { |m,n| inp[i+m][j+n]=='*' }
    count.zero? ? ' ' : count
  end
  
  def self.valid?(inp)
    inp.all? do |l|
      l.chars.all? { |c| c =~ /[+\-|* ]/ } && l.size == inp.first.size &&
      [l[0], l[-1]].all? { |c| c =~ /[+|]/ }
    end
  end
end