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

[D] Data Structure:

- Number

[A] Algorithm:

- From an odd number, 2a+1
  - generate an array (x), [1, 3, ..., 2a+1, ..., 3, 1]
  - generate an array (y), [a, a-1, ..., 1, 0, 1, ..., a-1, a]
- loop through the two arrays at the same time
  - for each iteration, print out x of number * prepended by y
    - y * " " + x * "*"

Further Thinking:

Hollow Diamonds?

Given n = 1

*

Given n = 3
 *
* *
 *

Given n = 5
  *
 * *
*   *
 * *
  *

Given n = 9
    *
   * *
  *   *
 *     *
*       *
 *     *
  *   *
   * *
    *

[A] Algorithm:

- Special case, number = 1
  - print only a star
- From an odd number, 2a+1
  - generate an array for number of prepended spaces [a, a-1, ..., 1, 0, 1, ..., a]
  - generate an array for number of hollow spaces [nil, 1, 3, ..., 2a-3, 2a-1, 2a-3, ... 3, 1, nil]
- loop through the two arrays at the same time
  - for each iteration, print out:
    - if the number of hollow spaces is not nil
      - " " * number of prepended spaces + "*" + " " * number of hollow spaces + "*"
    - if the number of hollow space is nil
      - " " * number of prepended space + "*"

=end

def print_diamond(size)
  number_of_diamond = (1...size).to_a + (1..size).to_a.reverse
  number_of_diamond.select!(&:odd?)

  number_of_space = number_of_diamond.map do |n_diamond|
    (size - n_diamond) / 2
  end

  number_of_diamond.each_with_index do |n_diamond, index|
    puts " " * number_of_space[index] + "*" * n_diamond
  end

  nil
end

print_diamond(3)
puts
print_diamond(9)
puts

def print_hollow_diamond(size)
  if size == 1
    puts "*"
    return nil
  end

  a = (size - 1) / 2
  num_of_prepended_space = (0..a).to_a.reverse + (1..a).to_a

  num_of_hollow_space = (1...(size - 2)).to_a + (1..(size - 2)).to_a.reverse
  num_of_hollow_space.select!(&:odd?)
  num_of_hollow_space.prepend(nil).append(nil)

  num_of_hollow_space.each_with_index do |n_hollow_space, index|
    if n_hollow_space.nil?
      puts " " * num_of_prepended_space[index] + "*"
    else
      puts " " * num_of_prepended_space[index] + "*" + " " * n_hollow_space + "*"
    end
  end

  nil
end

print_hollow_diamond(9)
puts
print_hollow_diamond(5)
puts
print_hollow_diamond(3)
puts
print_hollow_diamond(1)
puts
