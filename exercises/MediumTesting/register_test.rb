require 'minitest/autorun'

require_relative 'transaction.rb'
require_relative 'cash_register.rb'

class CashRegisterTest < MiniTest::Test
  attr_reader :cash_register, :transaction1
  
  def setup
    @cash_register = CashRegister.new(1_000)
    @transaction1 = Transaction.new(40)
  end
  
  def test_accept_money
    transaction1.amount_paid = 40
    cash_register.accept_money(transaction1)
    assert_equal(1040, cash_register.total_money)
  end
  
  def test_change
    transaction1.amount_paid = 60
    assert_equal(20, cash_register.change(transaction1))
  end
  
  def test_give_receipt
    result = "You've paid $#{transaction1.item_cost}.\n"
    assert_output(result) { cash_register.give_receipt(transaction1) }
  end
end