# Attempt 1

def missing(arr)
  result = (arr.first..arr.last).to_a
  arr.each do |num|
    result.delete(num)
  end
  result
end

# Attempt 2

def missing(array)
  output = []
  (array.first...array.last).each do |integer|
    output << integer unless array.include?(integer)
  end
  output
end

# Attempt 3

def missing(array)
  output = []
  array.each_cons(2) do |a, b|
    output += ((a + 1)..(b - 1)).to_a
  end
  output
end

# Further Exploration

# Attempt 1

def missing(arr)
  result = []
  index = 1
  until index == arr.size
    if arr[index] - arr[index - 1] > 1
      result += ((arr[index - 1] + 1)..(arr[index] - 1)).to_a
    end
    index += 1
  end
  result
end

# Attempt 2

=begin
- initialize an empty array for output
- initialize an index counter to 1 (2nd element)
- while the index counter is less than the array size,
  - if the difference between the current element and the previous one > 1,
    - push the integers between these two integers to the output array
  - increment the index counter by 1
- return the output array
=end

def missing(array)
  output = []
  index = 1
  while index < array.size
    if array[index] - array[index - 1] > 1
      output += ((array[index - 1] + 1)..(array[index] - 1)).to_a
    end
    index += 1
  end
  output
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
