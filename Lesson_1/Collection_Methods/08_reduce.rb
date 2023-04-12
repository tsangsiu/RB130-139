### Enumerable#reduce / Enumerable#inject

[1, 2, 3].reduce do |acc, num|
  acc + num
end
# => 6

[1, 2, 3].reduce(10) do |acc, num|
  acc + num
end
# => 16

### my attempt

def reduce(arr, acc = 0)
  arr.each do |element|
    acc = yield(acc, element)
  end
  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }
p reduce(array, 10) { |acc, num| acc + num }
# p reduce(array) { |acc, num| acc + num if num.odd? }

### extra challenge

# attempt 1
def reduce(arr)
  acc = arr.first.class.new
  arr.each do |element|
    acc = yield(acc, element)
  end
  acc
end

# attempt 2 (more general)
def reduce(enum, memo = nil)
  index = 0

  if memo.nil?
    accumulator = enum[index]
    index += 1
  else
    accumulator = memo
  end

  while index < enum.size
    accumulator = yield(accumulator, enum[index])
    index += 1
  end

  accumulator
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value } # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
