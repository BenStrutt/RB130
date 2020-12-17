class SecretHandshake
  attr_reader :handshake, :decoded
  
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump']
  
  def initialize(num)
    num = "0" unless num.is_a?(Integer) || num =~ /[0-9]+/
    @handshake = (num.is_a?(String)) ? num : num.to_s(2)
    @decoded = []
  end
  
  def commands
    handshake.chars.reverse.each_with_index do |b, i|
      i < 4 ? (decoded << COMMANDS[i] if b == "1") : decoded.reverse!
    end
    decoded
  end
end

handshake = SecretHandshake.new 9
p handshake.commands # => ["wink","jump"]

handshake = SecretHandshake.new "11001"
p handshake.commands # => ["jump","wink"]