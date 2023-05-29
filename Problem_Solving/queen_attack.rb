=begin

In the game of chess, a queen can attach pieces with are on the same row,
column, or diagonal.

So if you're told the white queen is at (2, 3) and the black queen at (5, 6),
then you'd know you've got a set up like so:

_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ W _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ B _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _

You'd also be able to answer whether the queens can attach each other. In this
case, that answer would be yes, they can, because both pieces share a diagonal.

[P] Understand the Problem:

- Input
  - a String representation of a board with two queens
  - W/B, and _
- Output
  - true/false
- Rules
  - true if two queens are
    - same row
      - W's row == B's row
    - same column
      - W's column == B's column
    - same diagonal
      - distance of rows == distance of column
        - distance: (x1 - x2).abs or (y1 - y2).abs

[E] Examples / Test Cases:

_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ W _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ B _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
=> true

_ _ _ _ _ _ _ _
_ W _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ B _ _ _ _ _ _
_ _ _ _ _ _ _ _
=> true

_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ W _ _ _ B _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
=> true

_ _ _ _ _ _ _ _
_ _ B _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ W _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
=> false

[D] Data Structure:
- chess board: 8x8 array of arrays
  - easier to express rows, columns and diagonals

[A] Algorithm:
- parse the input
- get the coordinates of W and B
- check the coordinates to see if W and B are in the same row, column or diagonal
- if yes, return true, else return false

=end

def queen_attack(board)
  board = board.split("\n").map(&:split)

  coord_black = []
  coord_white = []
  board.each_with_index do |row, row_index|
    row.each_with_index do |point, col_index|
      if point == 'B'
        coord_black = [row_index, col_index]
      elsif point == 'W'
        coord_white = [row_index, col_index]
      end
    end
  end

  coord_black[0] == coord_white[0] ||
  coord_black[1] == coord_white[1] ||
  (coord_black[0] - coord_white[0]).abs == (coord_black[1] - coord_white[1])
end

p queen_attack("_ _ _ _ _ _ _ _
_ _ B _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ W _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _") == false

p queen_attack("_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ W _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ B _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _") == true

p queen_attack("_ _ _ _ _ _ _ _
_ W _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ B _ _ _ _ _ _
_ _ _ _ _ _ _ _") == true

p queen_attack("_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ W _ _ _ B _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _") == true
