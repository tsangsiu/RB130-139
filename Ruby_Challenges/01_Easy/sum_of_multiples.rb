=begin

[P]
- Given a natural number (1, 2, 3, ...) and a set of one or more other numbers
- Find the sum of the multiples of the numbers in the set
  that are less than the natural number
- If the set of number is not given, use a default set of 3 and 5

[E]
- From the examples given, we need a `SumOfMultiples` class
  - It accepts one or more integers as arguemnts upon instantiation
  - It has a `to` class method and a `to` instance method
  - It seems that it is assumed that arguments passed in are valid
- Given a natural number 10, a set of number not given
  - Multiples of 3 and 5 that are up to, but not including 10: 3, 5, 6, 9
  - Sum = 3 + 5 + 6 + 9 = 23
- Given number 20, a set of number [7, 13, 17]
  - Multiples of 7, 13 and 17 that are up to, but not including 20:
    7, 13, 14, 17
  - Sum = 7 + 13 + 14 + 17 = 51

[D]
- Input: Integer (natural number), Array (a set of numbers)
- Output: Integer

[A]
- The `SumOfMultiples` class
  - Accepts multiple integers upon instantiation
  - Raises no error

- `SumOfMultiples#to`
  - Accepts an integer (the natural number) as an argument
  - Find the multiples of each number in the set that are up to,
    but not including, the natural number
  - Sum the unique multiples
  - Return the sum

- `SumofMultiples::to`
  - Accepts an integer (the natural number) as an argument
  - Find the multiples of 3 and 5 that are up to,
    but not including, the natural number
  - Sum the unique multiples
  - Return the sum

- Helper method: find the multiples
  - Given a natural number and a number `n`
  - Initialize an array with a single element 0 to store the multiples
  - Initialize a variable called `multiplier` to 1
  - Until `n` * `multiplier` >= natural number
    - Push `n` * `multiplier` to the array
    - Increment `multiplier` by 1
  - Return the array

=end

class SumOfMultiples
  def initialize(*int)
    @n = int
  end

  def to(natural_n)
    multiples = [0]
    @n.each do |n|
      multiples += multiples(n, natural_n)
    end
    multiples.uniq.sum
  end

  def self.to(natural_n)
    new(3, 5).to(natural_n)
  end

  private

  def multiples(n, natural_n)
    multiples = []
    multiplier = 1
    until n * multiplier >= natural_n
      multiples << n * multiplier
      multiplier += 1
    end
    multiples
  end
end
