=begin

[P]roblem
- Given a letter, return a hollow diamond starting with 'A'
- The supplied letter is at the widest point

[E]xample
- We need to write a `Diamond` class
  - It has a `make_diamond` class method
  - The `make_diamond` method takes a letter
- Given 'A', it returns:
  "A\n"
- Given 'B', it returns:
  " A \n"\
  "B B\n"\
  " A \n"
- Given 'C', it returns:
  "  A  \n"\
  " B B \n"\
  "C   C\n"\
  " B B \n"\
  "  A  \n"
- Given 'D', it returns:
  "   A   \n"\
  "  B B  \n"\
  " C   C \n"\
  "D     D\n"\
  " C   C \n"\
  "  B B  \n"\
  "   A   \n"

[D]ata Structure
- Input: String, a single capital letter
- Intermediate: Array, every element represents a layer
- Output: String

[A]lgorithm
- The `Diamond::make_diamond` method
  - Create an array (`ALPHABETS`) of capital letters
  - Initialize an empty array called `layers` which
      stores each layer of the diamond
  - Given a letter, get its index in `ALPHABETS`
  - Iterate from 0 to that index,
    - If the current number is 0,
      - Create the string: leading blanks, the letter 'A', trailing blanks, "\n"
      - Push the string to `layers`
    - Else,
      - Create the string:
          leading blanks, the letter, blanks in-between,
          the letter, trailing blanks, "\n"
      - Push the string to `layers`
  - Take all strings in `layers`, except for the last one
  - Reverse the order of those strings
  - Push those strings to `layers`
  - Join all elements in `layers` to form one single string
  - Return that string

=end

class Diamond
  LETTERS = ('A'..'Z').to_a

  def self.make_diamond(letter)
    letter_index = LETTERS.index(letter.upcase)

    layers = (0..letter_index).to_a.map do |layer_index|
      make_layer(layer_index, letter_index)
    end

    layers += layers[0...-1].reverse
    layers.join('')
  end

  class << self
    private

    def make_layer(layer_index, letter_index)
      if layer_index == 0
        "#{' ' * letter_index}#{LETTERS[layer_index]}#{' ' * letter_index}\n"
      else
        n_leading_blank = letter_index - layer_index
        "#{' ' * n_leading_blank}#{LETTERS[layer_index]}"\
        "#{' ' * (layer_index * 2 - 1)}"\
        "#{LETTERS[layer_index]}#{' ' * n_leading_blank}\n"
      end
    end
  end
end
