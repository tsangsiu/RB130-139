=begin

[P]
- Natural numbers can be uniquely categorised to abundant, perfect or deficient
- This classification is based on the sum of its divisors
  - Excluding the number itself
  - The sum is called the Aliquot sum
- Aliquot sum = original number => perfect numbers
- Aliquot sum < original number => deficient numbers
- Aliquot sum > original number => abundant numbers

[E]
- 13
  - divisors: 1
  - Aliquot sum = 1
  - Aliquot sum < 13 => deficient numbers
- 28
  - divisors: 1, 2, 4, 7, 14
  - Aliquot sum = 1 + 2 + 4 + 7 + 14 = 28
  - perfect number
- 12
  - divisors: 1, 2, 3, 4, 6
  - Aliquot sum = 1 + 2 + 3 + 4 + 6 = 16 > 12
  - abundant number

[D]
- Input: Integer
- Output: String

[A]
- We need a `PerfectNumber` class
  - has a class method called `classify` and takes an integer

- `PerfectNumber::classify`
  - accepts an integer
  - raise `StandardError` if the number is not a natural number
  - get all divisors of the number except itself
  - sum all the divisors
  - if the sum > the number
    - return 'abundant'
  - else if the sum < the number
    - return 'deficient'
  - else
    - return 'perfect'

- Helper method: to get all divisors
  - accepts an integer
  - initialize an empty array to contain all divisors
  - iterate from 1 to square root of the number
    - if the current number is a divisor
      - push the number to the empty array
  - return the array

=end

class PerfectNumber
  def self.classify(num)
    raise StandardError unless num > 0 && num.class == Integer
    aliquot_sum = divisors(num).sum
    if aliquot_sum < num
      'deficient'
    elsif aliquot_sum > num
      'abundant'
    else
      'perfect'
    end
  end

  class << self
    private

    def divisors(num)
      divisors = []
      (1..Math.sqrt(num)).each do |divisor|
        divisors << divisor << num / divisor if num % divisor == 0
      end
      divisors.sort[0...-1].uniq
    end
  end
end
