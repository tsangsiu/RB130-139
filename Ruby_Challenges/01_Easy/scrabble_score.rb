class Scrabble
  LETTER_TO_SCORE = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }

  def initialize(word)
    @word = word ? word : ''
  end

  def self.score(word)
    self.new(word).score
  end

  def score
    score = 0
    word = @word.upcase.gsub(/[^A-Z]/, '')
    word.upcase.split('').each do |letter|
      LETTER_TO_SCORE.each do |key, value|
        if key.include?(letter)
          score += value
          next
        end
      end
    end
    score
  end
end
