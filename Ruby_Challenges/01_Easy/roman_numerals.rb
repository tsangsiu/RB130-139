=begin

# Problem
- write a program to convert decimal number to Roman number equivalents
- consider number from 1 to 3,000 only
- *Roman numerals are written by expressing each digit separately starting
    with the left most digit and skipping any digit with a value of zero

# Examples
- refer to the test class

# Data Structure
- input: integer, from 1 to 3,000
- output: string

# Algorithm
- `RomanNumeral` class constructor
  - accept an integer as an argument
  - raise no error

- `RomanNumeral#to_roman`
  - create a hash that map decimal numbers (in descending order) to Roman number
    - keys: 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1
  - initialize `roman` to an empty string
  - while the given decimal number > 0
    - find the first key in the hash that is smaller than or equal to the decimal number
    - append the corresponding value to `roman`
    - deduct the value of the key from the decimal number
  - return `roman`
  
=end

class RomanNumeral
  # NUMBER_TO_ROMAN = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD',
  #                     100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL',
  #                     10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }

  NUMBER_TO_ROMAN = { 1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX', 10 => 'X',
                      40 => 'XL', 50 => 'L', 90 => 'XC', 100 => 'C',
                      400 => 'CD', 500 => 'D', 900 => 'CM', 1000 => 'M' }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman = ''
    current_number = @number
    NUMBER_TO_ROMAN.keys.sort.reverse.each do |key|
      next if key > current_number
      until current_number < key
        roman << NUMBER_TO_ROMAN[key]
        current_number -= key
      end
    end
    roman
  end
end
