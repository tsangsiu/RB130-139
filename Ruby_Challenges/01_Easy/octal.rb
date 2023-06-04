=begin

[P]
- Convert octal numbers to decimal numbers
- Treat invalid inputs as octal 0

[E]
- '1' -> 1 * 8^0 = 1
- '17' -> 1 * 8^1 + 7 * 8^0 = 15
- 'carrot' -> 0
- '234abc' -> 0

[D]
- Input: String
- Output: Integer

[A]
- We need an `Octal` class
  - Accepts a string as an argument upon instantiation
  - Raises no error
  - Contains a `to_decimal` instance method

- `Octal#to_decimal`
  - Returns 0 if the octal number is not valid
    - Contains strings other than integers
    - Contains integers 8 or 9
  - Split the octal string into an array of characters of integers
  - Iterate through the characters
    - Turn the character to integer
    - Map the current integer to current integer * place value
  - Sum the array of values and return it

=end

class Octal
  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 unless @octal =~ /\A[0-7]+\z/
    digits = @octal.chars.map(&:to_i).reverse
    values = digits.map.with_index do |digit, index|
      digit * 8**index
    end
    values.sum
  end
end
