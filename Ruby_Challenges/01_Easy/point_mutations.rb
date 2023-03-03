=begin

=== P ===
- To count the number of differences between two homologous DNA strands

=== E ===
- Need a `DNA` class
- Need `#hamming_distance`
- Count until the shorter DNA reaches its end

=== D ===
- Input: String for DNA
- output: `#hamming_distance` returns an Integer

=== A ===
- `#hamming_distance`
  - Find the shorter DNA between the calling object and the argument
  - Initialize a counter
  - Iterate through the shorter DNA character by character
    - If the current point is not the same as the corresponding one, increment the counter by 1
  - return the counter

=end

class DNA
  def initialize(dna)
    @dna = dna
  end

  def hamming_distance(dna)
    shorter_dna, longer_dna = [@dna, dna].sort_by { |el| el.length }
    count = 0
    shorter_dna.chars.each_with_index do |point, index|
      count += 1 if point != longer_dna[index]
    end
    count
  end
end
