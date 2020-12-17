require 'minitest/autorun'

require_relative 'swap.rb'

class SwapTest < MiniTest::Test
  attr_reader :file
  def setup
    @file = File.open('swap.txt')
  end
  
  def test_swap
    text = Text.new(file.read)
    
    swapped = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT
    
    assert_equal(swapped, text.swap('a', 'e'))
  end
  
  def test_word_count
    assert_equal(72, Text.new(file.read).word_count)
  end
  
  def teardown
    file.close
  end
end