class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
  
  def initialize(size)
    @size = size
    @buffer = []
  end
  
  def read
    raise BufferEmptyException if buffer.empty?
    
    buffer.pop
  end
  
  def write(val)
    raise BufferFullException if buffer.size == size
    
    buffer.unshift(val) unless val.nil?
  end
  
  def write!(val)
    unless val.nil?
      if buffer.size == size
        buffer.pop
        buffer.unshift(val)
      else
        write(val)
      end
    end
  end
  
  def clear
    self.buffer = []
  end
  
  private
  
  attr_accessor :buffer
  attr_reader :size
end