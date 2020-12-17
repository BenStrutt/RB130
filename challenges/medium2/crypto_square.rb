class Crypto
  attr_reader :text
  
  def initialize(text)
    @text = text.scan(/\w+/).join.downcase
  end
  
  def normalize_plaintext
    text
  end
  
  def size
    Math.sqrt(text.size).ceil
  end
  
  def plaintext_segments
    text.chars.each_slice(size).map(&:join)
  end
  
  def normalize_ciphertext
    cipher(' ')
  end
  
  def ciphertext
    cipher('')
  end
  
  def cipher(join)
    transpose(plaintext_segments.map(&:chars)).map(&:join).join(join)
  end
  
  private
  
  def transpose(matrix)
    transposed = []
    matrix[0].size.times do |m|
      temp = []
      matrix.size.times { |n| temp << matrix[n][m] unless matrix[n][m].nil? }
      transposed << temp
    end
    transposed
  end
end