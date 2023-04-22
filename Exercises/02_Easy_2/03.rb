# Attempt 1

def map(array)
  output = array.dup
  array.each_with_index do |element, index|
    output[index] = yield(element)
  end
  output
end

def map(array)
  output = []
  array.each do |element|
    output << yield(element)
  end
  output
end

# Attempt 2

def map(arr)
  arr.each_with_object([]) do |ele, obj|
    obj << yield(ele)
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
