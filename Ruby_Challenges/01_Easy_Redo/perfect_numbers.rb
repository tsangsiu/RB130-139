=begin

[P]
- Write a program to determine if a number is perfect, abundant, or deficient
- If a number = its Aliquot sum, it is a perfect number
  If a number < its Aliquot sum, it is a deficient number
  If a number > its Aliquot sum, it is an abundant number
- The Aliquot sum of a number is defined as the sum of its divisors
  excluding the number itself

[E]
- 6
  Divisors: 1, 2, 3
  The Aliquot sum = 1 + 2 + 3 = 6 => perfect number
- 13
  Divisors: 1
  The Aliquot sum = 1 < 13 => deficient number
- 12
  Divisors: 1, 2, 3, 4, 6
  The Aliquot sum = 1 + 2 + 3 + 4 + 6 = 16 > 12 => abundant number

- We need to write a `PerfectNumber` class
  - It has a class method `::classify`, which accepts an Integer

[D]
- Input: Integer
- Output: String

[A]
- `PerfectNumber::classify`
  - It accepts an Integer as an argument
  - It raises `StandardError` if it is not a positive integer
  - Find the divisors of the given number, excluding the number itself
  - Find the sum of the divisors
  - If the sum = given number, return 'perfect'
    Else if the sum < given number, return 'deficit'
    Else return 'abundant'

- Helper method: `divisors`
  - It accepts an Integer as an arguement and returns it divisors
  - Initialize an empty array to `divisors`
  - Iterate from 1 to the given number
    - If the given number is divisible by the current number,
      - push the number to `divisors`
  - Return `divisors`

=end

class PerfectNumber
  def self.classify(int)
    raise StandardError if int <= 0
    p divisors(int)
    aliquot_sum = divisors(int).sort[0...-1].sum
    if aliquot_sum == int
      'perfect'
    elsif aliquot_sum < int
      'deficient'
    else
      'abundant'
    end
  end

  class << self
    private

    def divisors(int)
      divisors = []
      (1..Math.sqrt(int).floor).each do |num|
        divisors << num << int / num if int % num == 0
      end
      divisors.sort
    end
  end
end
