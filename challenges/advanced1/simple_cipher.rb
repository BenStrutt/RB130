require 'pry'

class Cipher
  attr_reader :key
  
  def initialize(key = 'aaaaaaaaaa')
    raise ArgumentError unless key =~ /^[a-z]+$/
    @key = key
  end
  
  def encode(text)
    code(text, '>', '+', 122, -26)
  end
  
  def decode(text)
    code(text, '<', '-', 97, 26)
  end
  
  def code(text, comp, add, val, wrap)
    text.chars.map.with_index do |c, i|
      c = c.ord.send(add, (key[i].ord - 97))
      (c.send(comp, val) ? c + wrap : c).chr
    end.join
  end
end