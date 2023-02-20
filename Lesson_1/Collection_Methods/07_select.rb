### Array#select

array = [1, 2, 3, 4, 5]

p array.select { |num| num.odd? } # => [1, 3, 5]
p array.select { |num| puts num } # => []
p array.select { |num| num + 1 } # => [1, 2, 3, 4, 5]

puts

### my attempt

def select(arr)
  result_arr = []
  (0...arr.size).each do |index|
    result_arr << arr[index] if yield(arr[index])
  end
  result_arr
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num + 1 }
