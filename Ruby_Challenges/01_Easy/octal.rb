=begin

# Problem
- given an octal input string, output its decimal
- treat invalid input as octal 0

# Examples
- we need a `Octal` class
- we need an `to_decimal` instance method
  - return `0` if the argument is invalid

# Data Structure
- input: string
- output: integer, decimal

# Algorithm
- constructor
  - accept a string as an argument
  - raise no error at this point
  
- help method: `Octal#valid_input?`
  - return `false` if the given string contains characters other than 0-7

- `Octal#to_decimal`
  - accepts no argument
  - return `0` if the calling string contains invalid characters
  - initialize `dec` to `0`
  - split the calling string into an array individual character
  - convert each character back to an integer
  - reverse the array
  - iterate through the array with index
    - increment `dec` by the current integer * 8 ** current index
  - return `dec`

=end

class Octal
  def initialize(oct)
    @oct = oct
  end

  def to_decimal
    return 0 unless valid_input?
    dec = 0
    digits = @oct.chars.map(&:to_i).reverse
    digits.each_with_index do |digit, idx|
      dec += digit * 8**idx
    end
    dec
  end

  private

  def valid_input?
    !@oct.match?(/[^0-7]/)
  end
end
