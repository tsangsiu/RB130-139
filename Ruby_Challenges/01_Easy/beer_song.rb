=begin

[P]
- Write a program to generate the lyrics of the 99 Bottles of Beer song.

[E]
- From the test cases given, we need to write a `BeerSong` class
- The `BeerSong` class has a `verse` class method
  - It accepts an integer representing the verse
- The `BeerSong` class also has a `verses` class method
  - It accepts two integers representing from verse a and to verse b
- The `BeerSong` class also has a `lyrics` class method
  - It returns the whole song, from verse 99 to verse 0
- When the verse number is 2
  - return the string:
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
- When the verse number is 1
  - return the string:
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
- When the verse number is 0
  - return the string:
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
- When the verse number is from 99 to 98:
  - return the string:
    "99 bottles of beer on the wall, 99 bottles of beer.\n" \
    "Take one down and pass it around, 98 bottles of beer on the wall.\n" \
    "\n" \
    "98 bottles of beer on the wall, 98 bottles of beer.\n" \
    "Take one down and pass it around, 97 bottles of beer on the wall.\n"
- When the verse number is from 2 to 0:
  - return the string:
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
    "\n" \
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n" \
    "\n" \
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
- When `BeerSong::lyrics` is called
  - return the string representing the lyrics of the whole song
  - from verse 99 to 0
- The maximum and minimum number of verse should be 99 and 0

[D]
- Input: Integers
- Intermediate: Array
    - to store verses 0 and 1 (special cases)
    - to store a template for verse 2 and beyond
- Output: String

[A]
- `BeerSong` class
  - There is no `initialize` method, as no object instantiation is needed
  - It contains a constant array to store
    - Verses 0 and 1 (special cases)
    - A template for verse 2 and beyond:
      "X bottle(s) of beer on the wall, X bottle(s) of beer.\n" \
      "Take one down and pass it around, X bottle(s) of beer on the wall.\n"

- `BeerSong::verse`
  - It accepts an integer representing the verse number
  - If the number is 0 and 1,
    - Return the corresponding string
  - Else if the number is greater or equal to 2,
    - Return the template string with applicable parts modified

- `BeerSong::verses`
  - It accepts two integers representing from verse a to verse b
  - Get the lyrics for each verse
  - Combine them together, separated by "\n"
  - Return the combined string

- `BeerSong::lyrics`
  - This is essentially `BeerSong::verse(99, 0)`

=end

class BeerSong
  VERSES01 = [
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n",
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  ]

  def self.verse(number)
    if [0, 1].include?(number)
      VERSES01[number]
    else
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number - 1} " \
      "#{number - 1 > 1 ? 'bottles' : 'bottle'} of beer on the wall.\n"
    end
  end

  def self.verses(from, to)
    each_verse = (to..from).to_a.reverse.map do |number|
      verse(number)
    end
    each_verse.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
