=begin

=== P ===
- To convert numbers to Romain numerals
- There is no need to be able to convert numbers >= 3,000

=== E ===
- Need a `RomanNumeral` class
- The `to_roman` method convert number to roman numerals

=== D ===
- Input: Integer
- Output: String

=end

class RomanNumeral
  NUMBER_TO_ROMAN = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

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
