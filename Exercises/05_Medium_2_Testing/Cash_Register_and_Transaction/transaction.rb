class Transaction
  attr_reader :item_cost
  attr_accessor :amount_paid

  def initialize(item_cost)
    @item_cost = item_cost
    @amount_paid = 0
  end

  # def prompt_for_payment
  #   loop do
  #     puts "You owe $#{item_cost}.\nHow much are you paying?"
  #     @amount_paid = gets.chomp.to_f
  #     break if valid_payment? && sufficient_payment?
  #     puts 'That is not the correct amount. ' \
  #          'Please make sure to pay the full cost.'
  #   end
  # end

  # def prompt_for_payment(input: $stdin)
  #   loop do
  #     puts "You owe $#{item_cost}.\nHow much are you paying?"
  #     # notice that we call `gets` on that parameter
  #     # `$stdin.gets.chomp` is equivalent to `gets.chomp`
  #     @amount_paid = input.gets.chomp.to_f
  #     break if valid_payment? && sufficient_payment?
  #     puts 'That is not the correct amount. ' \
  #          'Please make sure to pay the full cost.'
  #   end
  # end

  def prompt_for_payment(input: $stdin, output: $stdout)
    loop do
      output.puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = input.gets.chomp.to_f
      break if valid_payment? && sufficient_payment?
      output.puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end

  private

  def valid_payment?
    amount_paid > 0.0
  end

  def sufficient_payment?
    amount_paid >= item_cost
  end
end
