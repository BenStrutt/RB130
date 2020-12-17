require 'minitest/autorun'

class OddTest < MiniTest::Test
  attr_reader :value
  
  def setup
    @value = 5
  end
  
  def test_odd?
    assert_kind_of(Numeric, value)
  end
end
