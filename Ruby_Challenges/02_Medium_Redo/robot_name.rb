=begin

[P]roblem
- Write a program to manage robot factory settings
- When a robot comes off the factory floow, it has no name
- When a robot is first booted up, a random name is generated
- When a robot is reset to its factory setting, its name gets wiped
- A new random name is generated when asked (booted again)
- Two robots cannot share the same name

[E]xample
- We need to write a `Robot` class
  - It has a `name` instance method which returns the robot's name
  - It has a `reset` method

[D]ata Structure
- Robot names: String
- To store names that are in use: Array

[A]lgorithm
- `Robot` class
  - It should have an array to store all names that are in use

  - Constructor
    - Upon instantiation, no name is assigned

  - `Robot#name`
    - If a `Robot` object has no name, a new random name is generated,
    - That new name is not used by other robots
    - The name is in the format AB123
    - Record the newly-generated name so that it is not used by other robots
    - Return robot's name

  - `Robot#reset`
    - Clear the name of the robot
    - Make that name available for use for other robots
=end

class Robot
  LETTERS = ("A".."Z").to_a
  DIGITS = (0..9).to_a

  @@names_in_use = []

  def initialize
    @name
  end

  def name
    return @name unless @name.nil?
    @name = new_name
  end

  def reset
    @@names_in_use.delete(@name)
    @name = nil
  end

  private

  def new_name
    name = nil
    loop do
      name = "#{LETTERS.sample}#{LETTERS.sample}"\
             "#{DIGITS.sample}#{DIGITS.sample}#{DIGITS.sample}"
      break unless @@names_in_use.include?(name)
    end
    @@names_in_use << name
    name
  end
end
