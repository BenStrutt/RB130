class Matrix
  attr_reader :matrix
  
  alias :rows :matrix
  
  def initialize(str)
    @matrix = str.split("\n").map { |l| l.split(' ').map(&:to_i) }
  end
  
  def columns
    matrix.transpose
  end
  
  def saddle_points
    saddles = []
    (0...rows.size).each do |r|
      (0...columns.size).each do |c|
        n = matrix[r][c]
        valid = rows[r].all? { |m| n >= m } && columns[c].all? { |m| n <= m }
        saddles << [r, c] if valid
      end
    end
    saddles
  end
end