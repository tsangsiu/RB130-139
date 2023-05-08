=begin

# Problem
- write a program to determine if a number is perfect, abundant or deficient

# Examples
- 6; divisors 1, 2, 3; 1 + 2 + 3 = 6 => perfect
- 28; divisors 1, 2, 4, 7, 14; 1 + 2 + 4 + 7 + 14 = 28 => perfect
- 15; divisors 1, 3, 5; 1 + 3 + 5 = 9 < 15 => deficient
- 24; divisors 1, 2, 3, 4, 6, 8, 12; 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 > 24 => adundant
- prime numbers are always deficient
- the Aliquot sum of a number is the sum of its divisors excluding itself

- we need a `PerfectNumber` class
- and a class method `::classify`
  - accepts an integer, returns a string (classification)
  - raises StandardError if not a positive integer

# Data Structure
- input: integer
- output: string, 'deficient', 'perfect', or 'abundant'

# Algorithm
- helper method: `PerfectNumber::factors`
  - input: a positive integer
  - output: an array of its factors, excluding itself
  - raise StandardError if the argument is not a positive integer
  - initialize `factors` to an empty array
  - iterate from 1 to square root of the given number, say `n`
    - if the current number is a factor,
      - push the current number to `factors`
      - push also `n`/current number to `factots`
  - remove `n` from `factors`
  - return the sorted `factors`
  
- `PerfectNumber::classify`
  - takes a positive integer as an argument
  - raise StandardError if not
  - get an array of factors of the argument, exclusing the argument itself
  - sum all the factors
  - compare the sum and the argument
  - if sum < argument
    - return 'deficient'
  - else if sum == argument
    - return 'perfect'
  - else if sum > argument
    - return 'abundant'

=end

class PerfectNumber
  def self.classify(int)
    raise StandardError if int.class != Integer || int <= 0
    factors = factors(int)
    sum_of_factors = factors.sum
    if sum_of_factors < int
      return 'deficient'
    elsif sum_of_factors == int
      return 'perfect'
    else
      return 'abundant'
    end
  end
  
  def self.factors(int)
    raise StandardError if int.class != Integer || int <= 0
    factors = []
    1.upto(Math::sqrt(int)) do |num|
      factors << num << int / num if int % num == 0
    end
    factors.delete(int)
    factors.sort!
  end
end
