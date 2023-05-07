require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(1_000)
    @item_cost = 88; @amount_paid = 100
    @transaction = Transaction.new(@item_cost)
    @transaction.amount_paid = @amount_paid
  end

  def test_accept_money
    @transaction.amount_paid = @item_cost

    amount_before_transaction = @register.total_money
    @register.accept_money(@transaction)
    amount_after_transaction = @register.total_money

    assert_equal(amount_before_transaction + @item_cost,
                  @register.total_money)
  end

  def test_change
    assert_equal(@amount_paid - @item_cost, @register.change(@transaction))
  end

  def test_give_receipt
    # `puts` adds `\n` at the end
    assert_output("You've paid $#{@item_cost}.\n") do
      @register.give_receipt(@transaction)      
    end
  end
end
