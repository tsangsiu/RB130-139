=begin

Problem
- Write a program that takes a string of digits and return all possible
  consecutive number series of a specified length in that string

Example
- String: '01234'; Length: 1
  Return: [[0], [1], [2], [3], [4]]
- String: '01234'; Length: 2
  Return: [[0, 1], [1, 2], [2, 3], [3, 4]]
- String: '01234'; Length: 5
  Return: [[0, 1, 2, 3, 4]]
- String: '01234'; Length: 6
  Return: ArgumentError

- From the test cases, we need to write a `Series` class
- It has a `Series#slices` instance method

Data Structure
- Input: String
- Output: Array

Algorithm
- `Series` class
  - Constructor
    - It accepts a String of digits as an argument
    - It raises no error
  - `slices`
    - It accepts an Integer, which represents the length, as an argument
    - It raises `ArgumentError`
      if the Integer is larger than the length of the String
    - Initialize an empty Array to `output`
    - Iterate through the String of digit
      - Get the substring of desired length
      - Convert the substring into an Array of digit
      - Push to Array to `output`
    - Return `output`

=end

class Series
  def initialize(string_of_digits)
    @string_of_digits = string_of_digits
  end

  def slices(length)
    raise ArgumentError if length > @string_of_digits.length
    output = []
    0.upto(@string_of_digits.length - length).each do |index|
      output << @string_of_digits[index, length].chars.map(&:to_i)
    end
    output
  end
end
