# using custom `each_with_index` method

factorial = Enumerator.new do |yielder|
  fact = 1
  num = 0
  loop do
    fact = num == 0 ? 1 : fact * num
    yielder << fact
    num += 1
  end
end

# this custom `each_with_index` does not return the original `enum` though
def each_with_index(enum)
  enum.rewind
  index = 0
  loop do
    yield(enum.next, index)
    index += 1
  end
  # enum.rewind # this line is not executed
end

each_with_index(factorial) do |val, num|
  puts "#{num}! = #{val}"
  break if num > 5
end

puts

each_with_index(factorial) do |val, num|
  puts "#{num}! = #{val}"
  break if num > 5
end
