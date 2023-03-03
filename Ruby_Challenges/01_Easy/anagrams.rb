class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select do |word|
      anagram?(word)
    end
  end

  private

  def anagram?(word)
    @word.downcase != word.downcase &&
      @word.downcase.split('').sort == word.downcase.split('').sort
  end
end
