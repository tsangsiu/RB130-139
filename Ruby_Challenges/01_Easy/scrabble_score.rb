=begin

[P]
- Write a program that calculates a word's scrabble score
- The score is calculated by summing the scores of individual characters
- Case-insensitive
- Non alphabets (blanks, \t, \n, nil) score no point
- An alphabet-to-score table is given

[E]
- 'CABBAGE'
  -> 3 + 1*2 + 3*2 + 2 + 1 = 14
- 'Cabbage'
  -> 3 + 1*2 + 3*2 + 2 + 1 = 14
- " \t\n"
  -> 0
- ""
  -> 0

[D]
- Input: string
- Intermediate: Array to store individual characters
- Output: Integer

[A]
- We need a `Scrabble` class
  - which includes the `score` instance method
  - includes a `score` instance method
  - includes also a `score` class method
  - includes a hash for alphabet-to-score conversion

- `Scrabble#score`
  - Accepts an argument
  - return 0 if the argument is not a string
  - Split the word into individual characters and get rid of the non-alphabets
  - Turn all alphabets to uppercase letters
  - Initialize a variable called `score` to 0
  - Iterate through the array of alphabets
    - Increment `score` by the corresponding alphabet score
  - return `score`

- `Scrabble::score`
  - Call the instance method `score` and pass in the word as an argument

=end

class Scrabble
  ALPHABET_TO_VALUE = {
    'A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1,
    'L' => 1, 'N' => 1, 'R' => 1, 'S' => 1, 'T' => 1,
    'D' => 2, 'G' => 2,
    'B' => 3, 'C' => 3, 'M' => 3, 'P' => 3,
    'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4, 'Y' => 4,
    'K' => 5,
    'J' => 8, 'X' => 8,
    'Q' => 10, 'Z' => 10
  }.freeze

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.class != String

    score = 0
    chars = @word.upcase.chars.select { |char| char =~ /[a-z]/i }
    chars.each { |char| score += ALPHABET_TO_VALUE[char] }
    score
  end

  def self.score(word)
    new(word).score
  end
end
