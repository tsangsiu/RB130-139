=begin

# Problem
- to write a program that takes a word and a list of anagrams
- selects the correct sublist that contains the anagrams of the word

# Examples
- Given the word "listen" and the list ["enlists", "google", "inlets", "banana"],
  return ["inlets"]
- case-insensitive
- create a `Anagram` class that accepts a string when instantiation
- a `Anagram#match` method
- *the same word is an not anagram of itself

# Data Structure
- input: a string, an array of strings
- output: array

# Algorithm
- constructor
  - accepts a string as an argument
  - no error is raised
  
- `Anagram#match`
  - iterate through the array of words passed into the method
  - if the word is an anagram to the calling word, select it
  - return the selection result
  
- `Anagram#anagram?(word)`
  - return false if both the calling word and the passed-in word are the same (after downcase)
  - for both the calling word and the passed-in word
    - turn to downcase
    - split them into individual characters
    - sort the result array
  - if both sorted arrays are the same, return true, else return false

=end

class Anagram
  def initialize(word)
    @word = word
  end
  
  def match(words)
    words.select do |word|
      anagram?(word)
    end
  end
  
  private
  
  def anagram?(word)
    @word.downcase != word.downcase &&
      @word.downcase.chars.sort == word.downcase.chars.sort
  end
end
