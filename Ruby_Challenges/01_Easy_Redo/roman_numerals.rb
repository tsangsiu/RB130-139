=begin

[P]
- To write a program that converts decimal numbers to Roman numbers
- We only concern numbers <= 3000

[E]
- We need to write a `RomanNumeral` class
  - Upon initialization, it accepts a decimal number as an argument
  - It has a `to_roman` instance method

1 => I
10 => X
27 => XXVII
48 => XLVIII
59 => LIX
141 => CXLI
402 => CDII
911 => CMXI
1024 => MXXIV
3000 => MMM

[D]
- Input: Integer
- Output: String

[A]
- `RomanNumeral` class
  - Initialize a hash that converts decimal numbers to roman numbers
    - The hash's key should be in descending order
    - The keys are key decimal numbers:
      - 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1

- Constructor
  - It accepts a decimal as an argument
  - Save the number to an instance variable for later use
  - It raises no error

- `RomanNumeral#to_roman`
  - Initialize `roman` to an empty string
  - Assign the decimal number to a local variable called `dec`
  - Iterate through the hash's keys
    - Go to the next iteration if `dec` is smaller than the current key
    - Loop until `dec` is smaller than the current key
      - Attach the corresponding hash value to `roman`
      - Subtract the current key from `dec`
  - Return `roman`

=end

class RomanNumeral
  # DEC_TO_ROMAN = {
  #   1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C',
  #   90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX',
  #   5 => 'V', 4 => 'IV', 1 => 'I'
  # }

  DEC_TO_ROMAN = {
    1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX', 10 => 'X',
    40 => 'XL', 50 => 'L', 90 => 'XC', 100 => 'C',
    400 => 'CD', 500 => 'D', 900 => 'CM', 1000 => 'M'
  }

  def initialize(decimal)
    @decimal = decimal
  end

  def to_roman
    roman = ''
    dec = @decimal
    DEC_TO_ROMAN.keys.sort.reverse.each do |key|
      next if dec < key
      until dec < key
        roman << DEC_TO_ROMAN[key]
        dec -= key
      end
    end
    roman
  end
end
