=begin

[P] Understanding the Problem
- Write a program to determine
  if a triangle is equilateral, isosceles, or scalene, given its three sides
- Equilateral
  - three sides are equal
- Isosceles
  - two of the sides are equal
- Scalene
  - all sides are of different length
- To form a triangles
  - length > 0
  - the sum of any two sides must be greater than the 3rd side

[E] Examples / Test Cases
(2, 2, 2) => 'equilateral'
(3, 4, 4) => 'isosceles'
(3, 4, 5) => 'scalene'
(0.3, 0.4, 0.6) => 'scalene'
(0, 0, 0) => ArgumentError, length 0
(3, 4, -5) => ArgumentError, -ve length
(1, 1, 3) => ArgumentError, invalid sides
(1, 1, 2) => ArgumentError, invalid sides

[D] Data Structure
- Input: Array, containing three numbers
- Output: String, or raising ArgumentError

[A] Algorithm
- Triangle class
  - accepts three numbers upon instantiation
  - raises ArgumentError if "invalid"

- help method: valid?
  - if length <= 0 or sum of the any two sides is shorter than the 3rd side
    - return false

- Triangle#kind
  - If three sides are equal
    - return 'equilateral'
  - Else if two sides are equal
    - return 'isosceles'
  - Else
    - return 'scalene'
=end

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError unless valid_triangle?
  end

  def kind
    case @sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else        'scalene'
    end
  end

  private

  def valid_triangle?
    valid_lengths? && valid_sides?
  end

  def valid_lengths?
    @sides.all? { |side| side > 0 }
  end

  def valid_sides?
    @sides[0] + @sides[1] > @sides[2] &&
      @sides[0] + @sides[2] > @sides[1] &&
      @sides[1] + @sides[2] > @sides[0]
  end
end
