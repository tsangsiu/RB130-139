=begin

[P]
- Write a program to generate robots' names
- In the format of [letter][letter][digit][digit][digit]
- No two robots share the same name

[E]
- From the test cases given,
  - We need to construct a `Robot` class
  - No argument is passed upon instantiation
  - Upon instantiation, the robot's name is assigned to `nil`
  - It has a `name` instance method
    - If the robot has a name, return it
    - Else, assign a name to the robot
  - It has a `reset` instance method
    - When called, the robot's name is erased
    - The erased name is available for future robot

[D]
- Input: No input
- Intermediate
  - A class variable to store used generated names
- Output: String

[A]
- `Robot` class
  - The class should have a class variable storing used generated names

- Instantiation
  - Raise no error upon instantiation

- `Robot#name`
  - If the robot has a name, return it
  - Else,
    - Generate a name
    - Assign it to the name variable
    - Return it

- `Robot#reset`
  - Delete the name from the class variable so as to free it
  - Set the robot's name to `nil`

- Helper method
  - A method to generate a name
    - Randomly select two letters
    - Randomly select three digits
    - Generate again if the generated name is one of the past names

=end

class Robot
  @@names_in_use = []

  LETTERS = ('A'..'Z').to_a
  DIGITS = (0..9).to_a

  def name
    @name = generate_name if @name.nil?
    @name
  end

  def reset
    @@names_in_use.delete(@name)
    @name = nil
  end

  private

  def generate_name
    name = nil
    loop do
      name = "#{LETTERS.sample}#{LETTERS.sample}"\
             "#{DIGITS.sample}#{DIGITS.sample}#{DIGITS.sample}"
      unless @@names_in_use.include?(name)
        @@names_in_use << name
        break
      end
    end
    name
  end
end
