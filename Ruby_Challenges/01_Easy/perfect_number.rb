class PerfectNumber
  def self.classify(number)
    raise StandardError if number <= 0 || number.class != Integer
    sum_of_factors = factors(number).sum
    result = case
             when sum_of_factors < number  then 'deficient'
             when sum_of_factors > number  then 'abundant'
             when sum_of_factors == number then 'perfect'
             end
    result
    factors(number)
  end

  private

  def self.factors(number)
    factors = [1]
    (2..Math.sqrt(number)).each do |n|
      factors << n << number / n if number % n == 0
    end
    factors.sort
  end
end
