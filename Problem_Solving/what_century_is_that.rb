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

[D] Data Structure:

- input
  - number
- rules
  - as data or as logic/code?

[A] Algorithm:

- century = (number - 1) / 100 + 1
- century string = century number to string, then "apply suffix rules"

Abstraction
- Given a number
  - if the last two digits are 11, 12, 13
    - return 'th'
  - else if the last digit is 1
    - return 'st'
  - else if the last digit is 2
    - return 'nd'
  - else if the last digit is 3
    - return 'rd'
  - else
    - return 'th'

=end

def number_suffix(num)
  if [11, 12, 13].include?(num % 100)
    'th'
  elsif num % 10 == 1
    'st'
  elsif num % 10 == 2
    'nd'
  elsif num % 10 == 3
    'rd'
  else
    'th'
  end
end

def century(year)
  century = (year - 1) / 100 + 1
  suffix = number_suffix(century)
  "#{century}#{suffix}"
end

p century(1)        == "1st"
p century(100)      == "1st"
p century(101)      == "2nd"
p century(133)      == "2nd"
p century(245)      == "3rd"
p century(1052)     == "11th"
p century(1152)     == "12th"
p century(1252)     == "13th"
p century(2012)     == "21st" 
p century(2112)     == "22nd"
p century(22222)    == "223rd"
