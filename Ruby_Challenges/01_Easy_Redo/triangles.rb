=begin

[P]
- To write a program to determine the type of the triangle,
  given the three sides
- The types of triangles are:
  'equilateral', 'isosceles', 'scalene'
- For a triangle to be valid,
  - the length of any side > 0
  - the sum of length of any two sides >= the length of the third side

[E]
- Input: 10, 10, 10
  Output: 'equilateral'
- Input: 3, 4, 4
  Output: 'isosceles'
- Input: 3, 4, 5
  Output: 'scalene'
- Input: (0, 0, 0) or (3, 4, -5) or (7, 3, 2)
  Raises `ArgumentError`

[D]
- Input: three numbers, representing the three sides
- Intermediate: Array to store the sides
- Output: String

[A]
We need to write a `Triangle` class
- Initialization
  - It accepts three numbers (sides) as arguments
  - It raises `ArgumentError` if the given sides cannot form a triangle

- `Triangle#kind`
  - If the three given sides can form a triangle,
    - return `equilateral` if all sides are equal
    - return `isosceles` if any two sides are equal
    - return `scalene`

- Private method: `valid_triangle?(side1, side2, side3)`
  - Return false if:
    - The length of any side <= 0
    - The sum of lengths of any two sides > the length of the third side

=end

class Triangle
  def initialize(*sides)
    raise ArgumentError unless valid_triangle?(*sides)
    @sides = sides
  end

  def kind
    return 'equilateral' if @sides.uniq.size == 1
    return 'isosceles' if @sides.uniq.size == 2
    'scalene'
  end

  private

  def valid_triangle?(*sides)
    return false if sides.size != 3
    return false if sides.any? { |side| side <= 0 }
    return false if sides[0] + sides[1] <= sides[2] ||
                    sides[0] + sides[2] <= sides[1] ||
                    sides[1] + sides[2] <= sides[0]
    true
  end
end
