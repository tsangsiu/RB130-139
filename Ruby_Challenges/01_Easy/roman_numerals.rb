=begin

[P]
- write a program to convert decimal numbers to their Roman equivalents
- M, D, C, L, X, V, I
- 1000, 500, 100, 50, 10, 5, 1
- no need to worry integer > 3000

[E]
- we need to write a RomanNumeral class
- accept an integer upon instantiation
- has a #to_roman method
- 1 => 'I'
- 2 => 'II'
- 4 => 'IV'
- 48 => 'XLVIII'
- 1024 => 'MXXIV'
- 3000 => 'MMM'

[D]
- input: integer <= 3000
- output: string
- we also need a hash to store the convertion from decimal to roman

[A]
- we need a RomanNumeral class
- construct a hash to convert decimal to Roman
  - keys: 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1
- Instantiation
  - accepts an integer as an argument
  - raise no error
- #to_roman
  - initialize an empty string for the Roman number output
  - until the decimal number reaches 0
    - iterate through the hash keys (which are decimal numbers) in order
      - if the key is smaller than or equal to the decimal number
        - reduce that amount from the number
        - append the Roman digit to the string
        - break the iteration
  - return the string (Roman number)

=end

class RomanNumeral
  DECIMAL_TO_ROMAN = {
    1 => 'I',
    4 => 'IV', 5 => 'V',
    9 => 'IX', 10 => 'X',
    40 => 'XL', 50 => 'L',
    90 => 'XC', 100 => 'C',
    400 => 'CD', 500 => 'D',
    900 => 'CM', 1000 => 'M'
  }

  def initialize(decimal)
    @decimal = decimal
  end

  def to_roman
    decimal = @decimal
    roman = ""
    keys = DECIMAL_TO_ROMAN.keys.sort.reverse
    until decimal == 0
      keys.each do |dec|
        if dec <= decimal
          decimal -= dec
          roman << DECIMAL_TO_ROMAN[dec]
          break
        end
      end
    end
    roman
  end

end
