=begin

[P]
- Given a string of digits of length `n` and an integer `m`,
  - Return all the possible consecutive number series of length `m`

[E]
- From the given test cases, we need a `Series` class
  - It accepts a string of digits upon instantiation
  - It raises no error upon instantiation
  - It has a `series` instance method
- Given "01234" and an integer 3
  - Return [[0, 1, 2], [1, 2, 3], [2, 3, 4]]
- Given "01234" and an integer 4
  - Return [[0, 1, 2, 3], [1, 2, 3, 4]]
- Given "81228" and an integer 5
  - Return [[8, 1, 2, 2, 8]]
- Raise `ArgumentError` if the integer is greater than the length of the string

[D]
- Input: String, Integer
- Output: Array

[A]
- `Series` class
  - Accepts a string as an argument
  - Raises no error upon instantiation

- `Series#slices`
  - Accepts an integer as an argument
  - Raise `ArgumentError` if the integer > the length of the string
  - Initialize an empty array called `result`
  - Split the string into individual characters and turn each character to digit
  - Iterate through the array of digits
    - Start from the current digit, slice the array with the desired length
    - Append the sub-array to `result`
  - Return `result`

=end

class Series
  def initialize(str)
    @str = str
  end

  def slices(len)
    raise ArgumentError if len > @str.length
    result = []
    digits = @str.chars.map(&:to_i)
    digits.each_cons(len) { |sub_arr| result << sub_arr }
    result
  end
end
