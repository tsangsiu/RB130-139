=begin

[P]
- Write a program to convert octal numbers to decimal numbers
- Treat invalid input as octal 0
  - A valid octal number should only contain 0-7

[E]
- '1' -> 1
- '17' -> 1*8 + 7*1 = 15
- 'carrot' -> 0 (invalid)
- '8' -> 0 (invalid)

- We need to write a `Octal` class
- It has a `to_decimal` instance method

[D]
- Input: String
- Output: Integer

[A]
- `Octal` class constructor
  - It accepts a String as an argument
  - It raises no error
  - Save the String for later use

- `Octal#to_decimal`
  - Return 0 if the given String is invalid
  - Split the String into individal digits
  - For each digits, calculate:
      digit * 8 ^ (place value)
  - Sum the results of all digits
  - Return the sum

- Helper method: `valid?`
  - It accepts a String as an argument
  - Return `true` if the given String only contains 0-7

=end

class Octal
  def initialize(str)
    @octal = str
  end

  def to_decimal
    decimal = 0
    return decimal unless valid?(@octal)
    digits = @octal.chars.map(&:to_i)
    digits.reverse.each_with_index do |digit, index|
      decimal += digit * 8**index
    end
    decimal
  end

  private

  def valid?(str)
    str.match?(/\A[0-7]+\z/)
  end
end
