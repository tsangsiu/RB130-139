def none?(array)
  array.each do |element|
    return false if yield(element)
  end
  true
end

# Further Exploration

def any?(array)
  array.each do |element|
    return true if yield(element)
  end
  false
end

def none?(array, &block)
  !any?(array, &block)
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
