require 'minitest/autorun'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(10)
    input = StringIO.new('12\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(12, transaction.amount_paid)
  end
end
