=begin

[Identifying and defining important terms and concepts]

Write a program that, given a word, computes the scrabble score for that word.

Letter Values

Letter                            Value
A, E, I, O, U, L, N, R, S, T        1
D, G                                2
B, C, M, P                          3
F, H, V, W, Y                       4
K                                   5
J, X                                8
Q, Z                                10

[P] Understanding the Problem

- Input: a string
  - lower case / upper case?
- Output: an integer (the scrabble score)
- Rules:
  - the score is the sum of scores of each letter in the string
  - the letter value table is used to loop up letter scores

[E] Examples / Test Cases:

score('a')          => 1
score('cabbage')    => 14
score('Cabbage')    => 14

[D] Data Structure:

- input
  - array of chars
- rules
  - look up table: hash/object
    - mini data structure choice: { a: 1, e: 1, ..., z: 10 }

[A] Algorithm:

- split the input into array of chars
- map to upper cased chars
- map each char into its scrabble score, referencing the look up table
- reduce with summing up the values

=end

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

def score(word)
  chars = word.chars.map(&:upcase)
  scores = chars.map do |char|
    LETTER_TO_SCORE[char]
  end
  scores.sum
end


p score('a') == 1
p score('cabbage') == 14
p score('Cabbage') == 14
