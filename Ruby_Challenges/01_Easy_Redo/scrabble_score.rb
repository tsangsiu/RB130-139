=begin

[P]
- Write a program to compute the scrabble score based on the given score table
- Letter cases do not matter
- Score 0 for empty strings or non-strings

[E]
- We need to construct a `Scrabble` class
- Upon initialization, it accepts an argument
- It has an `score` instance method to compute the score
- It also has an `score` class method that does the same thing

- '' => 0
- " \t\n" => 0
- nil => 0

[D]
- Input: Varies
- Output: Integer

[A]
- `Scrabble` class
  - Create a Hash for the score table

- Constructor
  - Upon initialization, it accepts an argument
  - Store the argument to an instance variable
  - It raises no error

- `Scrabble#score`
  - Return 0 for non-strings
  - Initialize `score` to 0
  - Turn the word to an array of individual characters
  - Iterate through the array of characters
    - Increment `score` by the score of the current character
  - Return `score`

- `Scrabble::score`
  - It accepts a string as an argument
  - Make use of `Scrabble#score`

=end

class Scrabble
  LETTER_TO_SCORE = {
    'A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1,
    'L' => 1, 'N' => 1, 'R' => 1, 'S' => 1, 'T' => 1,
    'D' => 2, 'G' => 2,
    'B' => 3, 'C' => 3, 'M' => 3, 'P' => 3,
    'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4, 'Y' => 4,
    'K' => 5,
    'J' => 8, 'X' => 8,
    'Q' => 10, 'Z' => 10
  }

  def initialize(word)
    @word = word
  end

  def score
    score = 0
    return score unless @word.class == String
    chars = @word.upcase.gsub(/[^A-Z]/, '').chars
    chars.each { |char| score += LETTER_TO_SCORE[char] }
    score
  end

  def self.score(word)
    new(word).score
  end
end
