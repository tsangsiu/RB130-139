require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def setup
    @item_cost = 88; @amount_paid = 100
    @transaction = Transaction.new(@item_cost)
    @transaction.amount_paid = @amount_paid
  end

  def test_prompt_for_payment
    input = StringIO.new("#{@amount_paid}\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(@amount_paid, @transaction.amount_paid)
  end
end
