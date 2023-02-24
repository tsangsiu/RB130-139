require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(0)
  end

  def test_accept_money
    transaction = Transaction.new(10)
    transaction.amount_paid = 12
    
    previous_amount = @cash_register.total_money
    @cash_register.accept_money(transaction)
    current_amount = @cash_register.total_money
    assert_equal(previous_amount + 12, current_amount)
  end
  
  def test_change
    transaction = Transaction.new(10)
    transaction.amount_paid = 12
    assert_equal(2, @cash_register.change(transaction))
  end
  
  def test_give_receipt
    transaction = Transaction.new(10)
    assert_output("You've paid $10.\n") do
      @cash_register.give_receipt(transaction)
    end
  end
end
