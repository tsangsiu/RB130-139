=begin

[Requirements are shown with examples]

Write a function that take an integer number as input, and prints out a diamond
with the "*" character whose width is the number n.

For example:

Given n = 3

 *
***
 *

Given n = 5

  *
 ***
*****
 ***
  *

[P] Understanding the Problem

- input: number
  - what happens when the number is 0?
  - what happens when number is an even number?
- output:
  - returns a string with the new line char "\n" delimiter
  - prints on the screen
- model the problem
  - given an odd number n, for example, 5
  - output n strings
    - 1, 3, 5, 3, 1
    - prepend number of spaces: 2, 1, 0, 1, 2
  - join together with \n, or loop and print

=end
