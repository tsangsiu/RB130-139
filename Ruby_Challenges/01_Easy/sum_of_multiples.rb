=begin

# Problem
- given a natural number (N), and a set of one or more other numbers (F1, F2, ...)
- find the sum of the multiples of F1, F2, ... that are less than N
- duplicate multiples are counted once only
- if F1, F2, ... are not given, use a default set of 3 and 5

# Example
- N = 10, F1, F2, ... not given
  N = 10, F1 = 3, F2 = 5
  multiples = [3, 5, 6, 9]
  sum = 3 + 5 + 6 + 9 = 23
- N = 20, F1 = 7, F2 = 13, F3 = 17
  multiples = [7, 14, 13, 17]
  sum = 7 + 14 + 13 + 17 = 51

- we need a `SumOfMultiples` class
  - it takes F1, F2, F3, ... upon instantiation
- we need an instance method `SumOfMultiples#to`
  - to calculate the sum of multiples given F1, F2, F3, ...
- we also need a class method `SumOfMultiples::to`
  - to calculate the sum of multiples given F1 = 3 and F2 = 5

# Data Structure
- input: integers, N and F1, F2, ... (optional)
- output: integer, sum

# Algorithm
- constructor
  - accepts integers (F1, F2, ...) as arguments

- `SumOfMultiples#to`
  - accepts an integer (N) as an argument
  - initialize `multiples` to an empty array
  - get all multiples of F1, F2, ... that are smaller than N
  - push all multiples to `multiples`
  - remove all duplicate multiples
  - return the sum of the unique multiples
  
- `SumOfMultiples::to`
  - accepts an integer (N) as an argument
  - initialize `multiples` to an empty array
  - get all multiples of 3 and 5 that are smaller than N
  - push all multiples to `multiples`
  - remove all duplicate multiples
  - return the sum of the unique multiples

- helper method: `#multiples`
  - accepts two integers (F and N) as arguments
  - initialize `multiples` to an empty array
  - initialize `i` to 1
  - while F * i < N
    - push F * i to `multiples`
    - increment `i` by 1
  - return `multiples`

=end

class SumOfMultiples
  def initialize(*f)
    @f = f
  end
  
  def to(n)
    multiples = []
    @f.each do |f|
      multiples << multiples(f, n)
    end
    multiples.flatten.uniq.sum
  end
  
  def self.to(n)
    multiples = []
    [3, 5].each do |f|
      multiples << multiples(f, n)
    end
    multiples.flatten.uniq.sum
  end

  def multiples(f, n)
    multiples = []
    i = 1
    while f * i < n
      multiples << f * i
      i += 1
    end
    multiples
  end
  
  def self.multiples(f, n)
    self.new.multiples(f, n)
  end
end
