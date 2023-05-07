=begin

# Problem
- to write a program that can calculate the Hamming distance between two DNA strands
- Hamming distance
  - the number of differences between two homologous DNA strands
  - example:
      GAGCCTACTAACGGGAT
      CATCGTAATGACGGCCT
      ^ ^ ^  ^ ^    ^^
    Hamming distance = 7
  - only defined for sequences of equal length
  - for sequence of unequal length, compute the distance over the shorter length

# Examples
- in the test class

# Data Structure
- input: string
- output: integer (distance)

# Algorithm
- constructor for the `DNA` class
  - take a string (a DNA strand) when instantiation

- `DNA#hamming_distance`
  - take a string (a DNA strand) as an argument
  - assign the shorter strand to `shorter_strand`
  - assign the longer strand to `longer_strand`
  - initialize `distance` to `0`
  - iterate over each character in `shorter_strand`
    - increment `distance` by 1 if the character in the corresponding position is not the same
  - return `distance`

=end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand)
    distance = 0
    shorter_strand, longer_strand = [@strand, strand].sort_by { |strand| strand.length }
    shorter_strand.chars.each_with_index do |dna, index|
      distance += 1 if dna != longer_strand[index]
    end
    distance
  end
end
