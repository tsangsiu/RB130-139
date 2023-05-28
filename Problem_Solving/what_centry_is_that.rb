=begin

[Implicit knowledge needs to be captured]

Write a function that takes an integer year as input and returns the century.
The return value should be a string that begins with the century number, and 
ends with st, nd, rd or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprises
the 20th century.

[P] Understanding the Problem

- input:
  - integer number
  - need to validate?
- output:
  - a string
  - begins with the century number
  - ends with st, nd, rd, or th
- rules:
  - new centries begin in years that end with 01
    - 1: st
    - 2: nd
    - 3: rd
    - 4-20: th
    - 21: st
    - 22: nd
    - 23: rd
    - 24-30: th
    ...
    - generalize:
      - century_number % 10
        - 1, 2, 3: st, nd, rd
        - 0, 4-9: th
      - except for 11, 12, 13

[E] Examples / Test Cases:

century(1)        => "1st"
century(100)      => "1st"
century(101)      => "2nd"
century(133)      => "2nd"
century(245)      => "3rd"
century(1052)     => "11th"
century(1152)     => "12th"
century(1252)     => "13th"
century(2012)     => "21st" 
century(2112)     => "22nd"
century(22222)    => "223rd"

=end
