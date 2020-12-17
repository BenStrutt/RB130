class DNA
  def initialize(strand)
    @strand = strand.split('')
  end
  
  def hamming_distance(new_strand)
    length = [strand.size, new_strand.size].min
    new_strand = new_strand.split('')
    counter = 0
    idx = 0
    until idx >= length
      counter += 1 unless strand[idx] == new_strand[idx]
      idx += 1
    end
    counter
  end
  
  private
  
  attr_reader :strand
end