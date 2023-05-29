=begin

Write a method that returns a list of all substrings of a string. The returned
list should be ordered by where in the string the substring begins. This means
that all substrings that start at position 0 should come first, then all 
substrings that start at position 1, and so on. Since multiple substrings will
occur at each position, the substrings at a given position should be returned in
order from shortest to longest.

Examples:

substrings('abcde')
// result
[ 'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e' ]

Abstraction:
- how do I get all substrings starting at a specific index
  - generate an array that are substrings of the string, starting at the index
    - slice
  - length: 1, 2, 3, 4.. (string.length - starting index)
- map the original array of chars to an array of all substrings starting with that char
  - mapping function: 
    - char => all substrings starting at a specific index

=end

def substrings(str)
  chars = str.chars
  substrs = chars.map.with_index do |char, index|
    substrs_arr = []
    (1..(str.length - index)).each do |length|
      substrs_arr << str[index, length]
    end
    substrs_arr
  end
  substrs.flatten
end

p substrings('abcde')
