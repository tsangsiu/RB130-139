=begin

[P]
- Given a word and a list of words, write a program to select words in the list
  that are anagrams to the given word
- Two words are anagrams if they comprise the same set of alphabets
- Identical words are not anagrams
- Case-insensitive

[E]
- We need to construct an `Anagram` class
  - Upon initialization, it accepts a string as an argument
  - It has a `match` instance method taking an array of string as an argument,
    and return a subset of the array of anagrams

- Given "listen" and ["enlists", "google", "inlets", "banana"],
  return ["inlets"]
- Given "corn" and %w(corn dark Corn rank CORN cron park),
  return ['cron']
- Given "mass" and ['last'],
  return []

[D]
- Input: a string (given word), an array (list of words)
- Output: an array of anagrams

[A]
- We need to write an `Anagram` class
  - Constructor
    - It accepts a string as an argument
    - It raises no error
    - Save the given string to an instance variable
  - Helper method: `anagram?`
    - It takes two strings as arguments
    - Turn both strings to lowcase
    - If both strings are the same, return false
    - Turn both strings to a sorted array of individual characters
    - If the arrays are the same, return true
  - `#match`
    - It accepts an array as an argument
    - Initialize an empty array to `anagrams`
    - Iterate through the given array
      - If the current word and the given word are anagrams,
        push the current word to `anagrams`
    - Sort `anagrams`
    - Return `anagrams`

=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    list.select { |word| anagram?(@word, word) }.sort
  end

  private

  def anagram?(word1, word2)
    word1.downcase != word2.downcase &&
      word1.downcase.chars.sort == word2.downcase.chars.sort
  end
end
