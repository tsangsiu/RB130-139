=begin

=== P ===
- To be a valid triangle, each side length must be greater than 0.
- To be a valid triangle, the sum of the lengths of any two sides must be
  greater than the length of the remaining side.
- An equilateral triangle has three sides of equal length.
- An isosceles triangle has exactly two sides of the equal length.
- A scalene triangle has three sides of unequal length (no two sides have equal
  length).

=== E ===
- Need a `Triangle` class
- The `Triangle` class has a `kind` instance method
- `#kind` returns 'equilateral', 'isosceles' or 'scalene'
- Raise `ArgumentError` if
  - any side is illegal
  - a triangle cannot be formed

=== D ===
- Input: 3 numbers
- Stored them in an array
- Output: String

=== A ===
- To do in the constructor method:
  - `valid?`
    - return `false` if any of the sides is non-positive
    - reutrn `false` if the sum of any two sides is smaller than or equal to the 3rd side
  - `can_form_triangle?`
    - return `false` if the sum of any two sides is smaller than or equal the 3rd side

- `#kind`
  - raise `ArgumentError` if not valid
  - if all sides are equal, return 'equilateral'
    - else if two of the sides are equal, return 'isosceles'
    - else return 'scalene'

=end

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError unless valid?
  end
  
  def kind
    if @sides.uniq.size ==  1
      'equilateral'
    elsif @sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end
  
  private
  
  def valid?
    return false if @sides.any? { |side| side <= 0 }
    return false unless can_form_triangle?
    true
  end
  
  def can_form_triangle?
    return false if @sides[0] + @sides[1] <= @sides[2]
    return false if @sides[0] + @sides[2] <= @sides[1]
    return false if @sides[1] + @sides[2] <= @sides[0]
    true
  end
end
