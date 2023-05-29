=begin

[P] Understanding the Problem
- Write a program to calculate the Hamming distance between two DNA strands.
- Hamming distance
  - The number of differences between two homologous DNA strands
  - GAGCCTACTAACGGGAT
    CATCGTAATGACGGCCT
    ^ ^ ^  ^ ^    ^^
    -> The Hamming distance is 7
  - Only defined for sequences of length lengths
  - For sequences of different lengths, compute over the shorter length

[E] Examples / Test Cases
''
''
-> 0

'GGACTGA'
'GGACTGA'
-> 0

'ACT'
'GGA'
-> 3

'AAACTAGGGG'
'AGGCTAGCGGTAGGAC'
  ^^    ^
-> 3

[D] Data Structure
- Input: string
- Intermediate: array
- Output: integer

[A] Algorithm
- We need to construct a DNA class

- instantiation
  - accept a string which represent a DNA string
  - raise no error

- DNA#hamming_distance
  - accept a string (which represent another DNA) as an argument
  - initialize a counter to 0 for hamming distance
  - find the shorter DNA strand between the calling object and the argument
  - convert both DNA strands as an array of characters
  - iterate over the shorter DNA strand
    - if the DNA is different for the current position
      - increment the counter by 1
  - return the counter

=end

class DNA
  def initialize(dna)
    @dna = dna
  end

  def hamming_distance(dna)
    distance = 0
    dna_shorter, dna_longer = [@dna, dna].sort_by { |dna| dna.length }.map(&:chars)
    dna_shorter.each_with_index do |dna, index|
      distance += 1 if dna != dna_longer[index]
    end
    distance
  end
end
