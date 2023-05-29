=begin

[Requirements are explicit]

Consider a characher set consisting of letters, a space, and a point. Words
consist of one or more, but at most 20 letters. An input text consists of one
or more words separated from each other by one or more spaces and terminated by 
0 or more spaces followed by a point. Input should be read from, and including, 
the first letter of the first word, up to and including the terminating point.
The output text is to be produced such that successive words are separated by a 
single space with the last word being terminated by a single point. Odd words
are copied in reverse order while even words are merely echoed.

For example, the input string
"whats the matter with kansas.""

becomes
"whats eht matter htiw kansas."

[P] Understanding the Problem:

- input:
  - 1 - many words
  - separated by:
    - 0 - many spaces
    - followed by a point
  - chars: letter, space, point, up to 20 letters
  - need to handle failure?
- output:
  - words: have the odd words reversed
  - odd means odd index number words, based on 0 index
  - separated by one space between words
  - terminated: 0 space, followed by a dot

[E] Examples / Test Cases:

reverse_odd_words("hello.")                 => "hello."
reverse_odd_words("hello .")                => "hello."
reverse_odd_words("hello world.")           => "hello dlrow."
reverse_odd_words("hello world .")          => "hello dlrow."
reverse_odd_words("hello  world  .")        => "hello dlrow."
reverse_odd_words("hello  hello world.")    => "hello olleh world."
reverse_odd_words("")                       => "."

[D] Data Structure:

- choice: string, array
- Array, because index is significant

[A] Algorithm:
- split string to array of strings with space or point
- map the array of strings to a new array
  - map function: reverse the odd indexed strings
    - reverse?? (if no reverse method)
- join the strings back together with a single space delimiter
- append a point at the end

=end

def reverse_odd_words(str)
  words = str.split(/[ .]+/)
  words = words.map.with_index do |word, index|
    index.odd? ? word.reverse : word
  end
  output = words.join(' ')
  output += '.'
  output
end

p reverse_odd_words("hello.")                 == "hello."
p reverse_odd_words("hello .")                == "hello."
p reverse_odd_words("hello world.")           == "hello dlrow."
p reverse_odd_words("hello world .")          == "hello dlrow."
p reverse_odd_words("hello  world  .")        == "hello dlrow."
p reverse_odd_words("hello  hello world.")    == "hello olleh world."
p reverse_odd_words("")                       == "."
