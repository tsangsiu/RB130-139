### Array#each

[1, 2, 3].each { |num| "do nothing"} # => [1, 2, 3]

### my attempt

def each(arr)
  (0...arr.size).each do |index|  # Range#each
    yield(arr[index])
  end
  arr
end

p each([1, 2, 3]) { |num| "do nothing" }
puts

### from LS

def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

each([1, 2, 3, 4, 5]) do |num|
  puts num
end
puts

p each([1, 2, 3, 4, 5]) { |num| "do nothing" }.select{ |num| num.odd? }
