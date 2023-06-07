=begin

[P]
- Given a letter, output a diamond shape

[E]
- From the given test cases, we need to write a `Diamond` class
  - It has a `make_diamond` class method

- Given 'A'
  A
  => "A\n"

- Given 'B'
   A
  B B
   A
  => " A \nB B\n A \n"

- Given 'E'
  "    A    \n"\
  "   B B   \n"\
  "  C   C  \n"\
  " D     D \n"\
  "E       E\n"\
  " D     D \n"\
  "  C   C  \n"\
  "   B B   \n"\
  "    A    \n"\

[D]
- Input: String
- Intermediate: Array to store the string of each layer
- Output: String

[A]
- We need an alphabet-to-number converter that converts alphanet to number
  in the following pattern:
  'A' -> 0, 'B' -> 1, 'C' -> 2, ..., 'Z' -> 25
- We also need a converter to convert number back to its corresponding alphabet:
  0 -> 'A', 1 -> 'B', 2 -> 'C', ..., 25 -> 'Z'

- `Diamond::make_diamond`
  - It accepts an alphabet as an argument
  - Convert the alphabet to a number, say `n`, based on the above pattern
  - Create two arrays
    - One, say `blank`, for the blanks before the first alphabet of each layer
    - One, say `core`, for the parts between and including the alphabets
  - From the tip of the diamond down to the widest part, consider each layer
    - For the preceding blanks for layer i (the tip is layer 0)
      - The number of preceding blank is n - i
    - For the core part
      - For layer 0,
        - "A"
      - For layer i,
        - alphabet at index i + " " * (2i - 1) + alphabet at index i
  - For each layer,
    - Sandwich the core with the preceding blanks
    - Add the new line character "\n" at the end
  - Reverse the diamond and attach it to the end of the original diamond
  - Combine all layers to a single string
  - Return the string (the full diamond)

=end

class Diamond
  ALPHABETS = ('A'..'Z').to_a

  def self.make_diamond(alphabet)
    # the first layer is the 0-th layer
    upper_layer = construct_upper_layer(alphabet)
    layer = upper_layer + upper_layer[0...-1].reverse
    layer.join
  end

  class << self
    private

    def alphabet_to_number(alphabet)
      ALPHABETS.index(alphabet.upcase)
    end

    def construct_preceding_space(alphabet)
      widest_layer = alphabet_to_number(alphabet)
      space = []
      (0..widest_layer).each do |layer|
        space << " " * (widest_layer - layer)
      end
      space
    end

    def construct_core(alphabet)
      widest_layer = alphabet_to_number(alphabet)
      core = []
      (0..widest_layer).each do |layer|
        core << if layer == 0
                  "A"
                else
                  ALPHABETS[layer] + " " * (2 * layer - 1) + ALPHABETS[layer]
                end
      end
      core
    end

    def construct_upper_layer(alphabet)
      widest_layer = alphabet_to_number(alphabet)
      upper_layer = []
      space = construct_preceding_space(alphabet)
      core = construct_core(alphabet)
      (0..widest_layer).each do |layer|
        upper_layer << space[layer] + core[layer] + space[layer] + "\n"
      end
      upper_layer
    end
  end
end
