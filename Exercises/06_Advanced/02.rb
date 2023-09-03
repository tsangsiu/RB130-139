# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class  # => Proc
my_proc.call  # => This is a .
my_proc.call('cat') # => This is a cat.

# `Proc` objects have lenient arity.
# Extra parameters will be assigned to `nil`.

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class  # Proc
my_lambda.call('dog') # => This is a dog.
# my_lambda.call  # => ArgumentError
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # => NameError

# Lambdas are also `Proc` objects.
# There is no `Lambda` class.
# Lambdas have strict arity.

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}  # => This is a .
# block_method_1('seal')  # => LocalJumpError

# Blocks have lenient arity.
# Invoking a method that yields to a block without an implicit block passed in will result in `LocalJumpError`.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}  # => This is a turtle.
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end # => This is a turtle and a .
# block_method_2('turtle') { puts "This is a #{animal}."} # => NameError

# Blocks have lenient arity.
# Extra parameters will be assigned to `nil`

=begin

`Proc`s
- `Proc` objects have lenient arity
- Extra parameters will be assigned to `nil`

Lambdas
- There is no `Lambda` class
- Lambdas are also `Proc`s
- Lambdas have strict arity

Blocks
- Implicit blocks have lenient arity
- Extra parameters will be assigned to `nil`

=end
