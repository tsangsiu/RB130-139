=begin

# Problem
- to write a program to determine if a triangle is equilateral, isosceles, or scalene

# Example
Triangle.new(2, 2, 2) == 'equilateral'
Triangle.new(3, 4, 4) == 'isosceles'
Triangle.new(3, 4, 5) == 'scalene'
Triangle.new(0, 0, 0) raises ArgumentError
Triangle.new(3, 4, -5) raises ArgumentError
Triangle.new(1, 1, 3) raises ArgumentError

# Data Structure
- input: three numbers, representing sides
- intermediate: array?
- output: string

# Algorithm
- constructor
  - accepts three arguments as three sides when instantiation
  - raise ArgumentError if the three given sizes are illegal

- `Triangle#valid_sides?`
  - return false if one of the sides <= 0
  - return false if the sum of any two sides is smaller than or equal to the third side
  - return true

- `Triangle#kind`
  - check if three sides are equal, return 'equilateral' if true
  - check if two of the sides are equal, return 'isosceles' if true
  - return 'scalene'

=end

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError unless valid_sides?
  end

  def kind
    if @sides.uniq.size == 1
      return 'equilateral'
    elsif @sides.uniq.size == 2
      return 'isosceles'
    else
      return 'scalene'
    end
  end

  private

  def valid_sides?
    return false if @sides.any? { |side| side <= 0 }
    return false if @sides[0] + @sides[1] <= @sides[2] ||
                    @sides[0] + @sides[2] <= @sides[1] || 
                    @sides[1] + @sides[2] <= @sides[0]
    true
  end
end
