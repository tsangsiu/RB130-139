items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1

gather(items) do |*items, last_item|
  puts items.join(", ")
  puts last_item
end

=begin
Let's start gathering food.
apples, corn, cabbage
wheat
We've finished gathering!
=end

# 2

gather(items) do |first_item, *items, last_item|
  puts first_item
  puts items.join(", ")
  puts last_item
end

=begin
Let's start gathering food.
apples
corn, cabbage
wheat
We've finished gathering!
=end

# 3

gather(items) do |first_item, *items|
  puts first_item
  puts items.join(", ")
end

=begin
Let's start gathering food.
apples
corn, cabbage, wheat
We've finished gathering!
=end

# 4

gather(items) do |item1, item2, item3, item4|
  puts "#{item1}, #{item2}, #{item3}, and #{item4}"
end

=begin
Let's start gathering food.
apples, corn, cabbage, and wheat
We've finished gathering!
=end
