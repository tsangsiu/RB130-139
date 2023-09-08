=begin

Problem
- Write a program that can generate the lyrics of the 99 Bottles of Beer song

Example
- See the test cases for lyrics for different verses

- We need to write a `BeerSong` class
- It has a `::verse` method
  - It accepts an Integer as an argument
  - It returns the verse indicated by the Integer
  - Verses 99 to 3 can be generalised, verses 2, 1 and 0 are different
- It also has a `::verses` method
  - It accepts two Integers as arguments
  - It returns the verses from Integer 1 down to Integer 2
- It also has a `::lyrics` method
  - It returns the full 99 Bottles of Beer song (verses 99 to 0)

Data Structure
- Input: Integers
- Output: String

Algorithm
- `BeerSong::verse`
  - It accepts an Integer as an argument
  - Verses 99 down to 3 can be generalised
  - Verses 2, 1 and 0 are special
  - Return the lyrics as in test cases
- `BeerSong::verses`
  - It accepts two Integers as arguments
  - We can make use of `BeerSong::verse`
- `BeerSong::Lyrics`
  - It accepts no argument
  - We can make use of `BeerSong::verses`

=end

class BeerSong
  def self.verse(verse)
    case verse
    when 0 then zero_bottle_verse
    when 1 then one_bottle_verse
    when 2 then two_bottle_verse
    else        default_verse(verse)
    end
  end

  def self.verses(from, to)
    from.downto(to).map { |verse| verse(verse) }.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def zero_bottle_verse
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end

    def one_bottle_verse
      "1 bottle of beer on the wall, " \
        "1 bottle of beer.\n" \
        "Take it down and pass it around, " \
        "no more bottles of beer on the wall.\n"
    end

    def two_bottle_verse
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end

    def default_verse(verse)
      "#{verse} bottles of beer on the wall, " \
        "#{verse} bottles of beer.\n" \
        "Take one down and pass it around, " \
        "#{verse - 1} bottles of beer on the wall.\n"
    end
  end
end
