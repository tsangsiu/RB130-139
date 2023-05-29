=begin

Write a program that takes a word problem and returns the answer as an integer.

E.g.

What is 5 plus 13?
- The program should return 18.

What is 7 minus 5?
- The program should return 2.

What is 33 divided by -3?
- The program should return -11.

What is -3 multiplied by 25?
- The program should return -75.

[P] Understanding the Problem:

[E] Examples / Test Cases:

answer('What is 5 plus 13?')
answer('What is 7 minus 5?')
answer('What is 33 divided by -3?')
answer('What is -3 multiplied by 25?')

[D] Data Structure:

- Input
  - String
- Output

Rules:
  - plus: +
  - minus: -
  - multiplied by: *
  - divided by: /

[A] Algorithm:

- parse the input
  - get the operands
  - get the operation
- return the result

=end

def answer(problem)
  problem = problem[0...-1] # to get rid of the '?'
  words = problem.split
  num1 = words[2].to_i; num2 = words[-1].to_i
  operation = words[3...-1].join(' ').downcase
  case operation
  when 'plus'          then num1 + num2
  when 'minus'         then num1 - num2
  when 'multiplied by' then num1 * num2
  when 'divided by'    then num1 / num2
  end
end

p answer('What is 5 plus 13?') == 18
p answer('What is 7 minus 5?') == 2
p answer('What is 33 divided by -3?') == -11
p answer('What is -3 multiplied by 25?') == -75
