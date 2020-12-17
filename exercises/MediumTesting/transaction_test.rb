require 'minitest/autorun'

require_relative 'transaction.rb'

class TransactionTest < MiniTest::Test
  attr_reader :transaction
  
  def setup
    @transaction = Transaction.new(40)
  end
  
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end
end