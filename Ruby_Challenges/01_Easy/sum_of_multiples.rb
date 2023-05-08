=begin

# Problem
- given a natual number N
- given another set of numbers M1, M2, ...
- M1, M2, ... may not be given
- find the sum of each of the multiples of M1, M2, ... that are smaller than N
- if M1, M2, ... are not given, use M1 = 3 and M2 = 5

# Examples
- N = 10, F1, F2, ... not given
  N = 10, F1 = 3, F2 = 5
  multiples = [3, 5, 6, 9]
  sum = 3 + 5 + 6 + 9 = 23
- N = 20, F1 = 7, F2 = 13, F3 = 17
  multiples = [7, 14, 13, 17]
  sum = 7 + 14 + 13 + 17 = 51

- from the test cases, we need to create a `SumOfMultiples` class
- the `SumOfMultiples` class has the following three methods:
  - the constructor
    - it accepts integers representing M1, M2, ...
  - `SumOfMultiples#to`
    - it accepts an integer representing N
  - `SumOfMultiples::to`
    - it accepts an integer representing N
    - M1 = 3 and M2 = 5

# Data Structure
- input: integers representing N and/or M1, M2, ...
- intermediate: array to store the multiples
- output: integer, the sum of all the desired multiples

# Algorithm
- constructor
  - accepts an unknown number of integers representing M1, M2, ...
  - assign the integers to an array to an instance variable `@m_s`

- `SumOfMultiples#to`
  - takes an integer representing N as an argument
  - output the sum of the desired multiples
  - initialize `multiples` to an empty array
  - for each of the number in `@m_s`,
    - get the their multiples up to, but not including N
    - push the multiples to `multiples`
  - remove duplicate numbers in `multiples`
  - return the sum of the numbers in `multiples`

- helper method: `SumOfMultiples#multiples`
  - takes two integers, N and M as arguments
  - initialize `multiples` to an empty array
  - initialize `num` to M
  - while `num` < N
    - push `num` to `multiples`
    - increment `num` by M
  - return `multiples`

- `SumOfMultiples::to`
  - takes an integer representing N as an argument
  - output the sum of the desided multiples
  - instantiate a `SumOfMultiples` object with M1 = 3 and M2 = 5
  - call `SumOfMultiples#to` on the above object with the passed-in argument

=end

class SumOfMultiples
  def initialize(*m)
    @m_s = m
  end

  def self.to(n)
    self.new(3, 5).to(n)
  end

  def to(n)
    multiples = []
    @m_s.each do |m|
      multiples << multiples(n, m)
    end
    multiples.flatten.uniq.sum
  end

  private

  def multiples(n, m)
    multiples = []
    num = m
    while num < n
      multiples << num
      num += m
    end
    multiples
  end
end
