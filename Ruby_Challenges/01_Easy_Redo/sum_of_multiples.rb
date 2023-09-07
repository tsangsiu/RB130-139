=begin

Problem
- Given a natural number `N` and a set of integers `I1`, `I2`, ...,
  - Find the sum of all multiples of `I1`, `I2`, ... that are less than `N`
  - If `I1`, `I2`, ... are not given, use 3 and 5
- Common multiples are not double counted
- Write a program to return the above sum of multiples

Example
- N = 4, I1 = 3
  Multiples = 3
  Sum = 3
- N = 15, I1 = 4, I2 = 6
  Multiples = 4, 8, 12, 6
  Sum = 4 + 8 + 12 + 6 = 30
- N = 10, I's not given
  Multiples = 3, 6, 9, 5
  Sum = 3 + 6 + 9 + 5 = 23

- We need to write a `SumOfMultiples` class
- Upon initialization, it accepts integers as arguments (I1, I2, ...)
- It has a `#to` instance method
  - It accepts an Integer as an argument, which corresponds to N
  - It corresponds to the case that `I1`, `I2`, ... are given
- It also has a `::to` class method
  - It accepts an Integer as an argument, which corresponds to N
  - It corresponds to the case that `I1`, `I2`, ... are not given

Data Structure

Algorithm
- `SumOfMultiples` Constructor
  - It accepts Integers as arguments (I1, I2, ...)
  - Save the Integers for later use
  - It raises no error

- `#to`
  - It accepts an Integer as an argument (N)
  - Find the multiples of I1, I2, ... that are less than N
  - Remove the duplicate multiples
  - Sum the multiples
  - Return the sum

- `::to`
  - It acccepts an Integer as an argument (N)
  - Find the multiples of 3 and 5 that are less than N
  - Remove the duplicate multiples
  - Sum the multiples
  - Return the sum
  - This method can make use of `#to`

- Helper method: `multiples`
  - It accepts two Integers as arguments, say `int` and `limit`
  - The method will return an array of multiples of `int` that are less than
    `limit`
  - Initialize `multiples` to an empty array
  - Initialize `multiple` to `int`
  - Until `multiple` >= `limit`
    - Push `multiple` to `multiples`
    - Increment `multiple` by `int`
  - Return `multiples`

=end

class SumOfMultiples
  def initialize(*ints)
    @ints = ints
  end

  def to(limit)
    multiples = []
    @ints.each do |int|
      multiples += multiples(int, limit)
    end
    multiples.uniq.sum
  end

  def self.to(limit)
    new(3, 5).to(limit)
  end

  private

  def multiples(int, limit)
    multiples = []
    multiple = int
    until multiple >= limit
      multiples << multiple
      multiple += int
    end
    multiples
  end
end
