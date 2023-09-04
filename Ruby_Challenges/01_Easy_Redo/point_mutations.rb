=begin

[P]
- To write a program that calcuates the Hamming distance
  between two DNA strands
- Hamming distance is the number of differences between two DNA strands
- If two DNA strands are of different length,
  calculate the Hamming distance over the shorter DNA strand

[E]
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
Hamming distance = 7

AGACAACAGCCAGCCGCCGGATT
AGG
  ^
Hamming distance = 1

We need to write a `DNA` class
  - Upon initialization
    - it accepts a string (DNA strand) as an argument
    - it raises no error
  - `DNA#hamming_distance`
    - it accepts a string of another DNA strand as an argument
    - it calculates the Hamming distance

[D]
- Input: String (DNA strand)
- Output: Integer (the Hamming distance)

[A]
- Constructor
  - accepts a string as an argument
  - save the string to an instance variable
  - raises no error

- `DNA#hamming_distance`
  - accepts a string of another DNA strand
  - select the shorter DNA strand
  - intialize `hamming_distance` to 0
  - iterate through the shorter DNA strand
    - if the two DNAs in the current position in both DNA strands are different,
      - increment `hamming_distance` by 1
  - return `hamming_distance`

=end

class DNA
  def initialize(dna)
    @dna = dna
  end

  def hamming_distance(dna)
    hamming_distance = 0
    shorter_dna, longer_dna = [@dna, dna].sort_by(&:length)
    shorter_dna.chars.each_with_index do |component, index|
      hamming_distance += 1 if component != longer_dna[index]
    end
    hamming_distance
  end
end
