=begin

# Problem
- write a program that, given a word, computes the Scrabble score for that word

# Examples
- 'CABBAGE' = 1*2 + 3*2 + 3 + 1 + 2
- create a `Scrabble` class, which has a `score` method
- empty string, non-alphabetical string, `nil` score `0`
- case-insensitive
- raise no-error

# Data Structure
- input: a string, word
- output: integer, score

# Algorithm
- create a constant hash for the scores in the class

- constructor
  - accept a string (or anything else) as an argument
  - raise no error
  
- `Scrabble#score`
  - initialize `score` to `0`
  - return `score` if the passed-in argument is not a string
  - for the string argument
    - remove all whitespace characters
    - turn to upcase
    - split into individual characters
  - iterate through the array of individual characters
    - add the corresponding score to `score`
  - return `score`

- `Scrabble::score`
  - similar to that of `Scrabble#score`

=end

class Scrabble
  SCORES = { 'A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1,
              'L' => 1, 'N' => 1, 'R' => 1, 'S' => 1, 'T' => 1,
              'D' => 2, 'G' =>	2,
              'B' => 3, 'C' => 3, 'M' => 3, 'P' => 3,
              'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4, 'Y' => 4,
              'K' => 5,
              'J' => 8, 'X' => 8,
              'Q' => 10, 'Z' => 10 }
  
  def initialize(str)
    @str = str
  end

  def score
    score = 0
    return score unless @str.class == String
    chars = @str.gsub(/\s/, "").upcase.chars
    chars.each do |char|
      score += SCORES[char]
    end
    score
  end
  
  def self.score(str)
    self.new(str).score
  end
end
