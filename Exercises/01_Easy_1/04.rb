def divisors(int)
  divisor = []
  (1..int).each do |num|
    divisor << num if int % num == 0
  end
  divisor
end

# Further Exploration

=begin
- initialize an empty array for output
- iterate from 1 to sqrt(n),
  - if n is divisible by the current number,
    - push the current number to the output array
    - push n / current number to the output array
- remove duplicate integers
- sort the output array
- return the output array
=end

def divisors(int)
  divisor = []
  (1..(Math.sqrt(int).to_i)).each do |num|
    divisor << num << int / num if int % num == 0
  end
  divisor.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]
p divisors(999962000357) == [1, 999979, 999983, 999962000357]
p divisors(9898004545065487)
