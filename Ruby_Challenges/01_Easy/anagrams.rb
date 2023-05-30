=begin

Write a program that takes a word and a list of possible anagrams and selects
the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists",
"google", "inlets", and "banana", the program should return a list containing
"inlets". Please read the test suite for the exact rules of anagrams.

[P]
- Given a word and a list of strings
  - select the correct sublist that contains that angrams of the word
- Two words are called anagrams if they contain the same set of alphabet
  - 'race' and 'care' are anagrams
  - 'knee' and 'keen' are anagrams
- Anagrams are case-insensitive

[E]
- We need an Anagram class
  - accepts a string upon instantiation
  - raise no error
- Anagrams are case-insensitive
- Identical words are not anagrams
- 'diaper', ['hello', 'world', 'zombies', 'pants'] => []
- 'ant', ['tan', 'stand', 'at'] => ['tan']
- 'master', ['stream', 'pigeon', 'maters'] => ['stream', 'maters']
- 'Orchestra', ['cashregister', 'Carthorse', 'radishes'] => ['Carthorse']

[D]
- input: string, an array of strings
- output: array

[A]
- Anagram class
- Instantiation
  - take a string as an argument
  - raise no error
- #match
  - take an array of strings as an argument
  - initialize an empty array for output
  - iterate over the array of strings passed in
    - convert the current string to downcase
    - split the current string into an array of individual characters
    - if the current string shares the same set of characters
      with the calling string
      - push the current string to the output array
  - return the output array

=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(arr_str)
    output = []
    arr_str.each do |str|
      chars_word = @word.downcase.chars.sort
      chars_str = str.downcase.chars.sort
      output << str if chars_word == chars_str && @word.downcase != str.downcase
    end
    output
  end
end
