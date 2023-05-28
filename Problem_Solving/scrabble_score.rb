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

=end
