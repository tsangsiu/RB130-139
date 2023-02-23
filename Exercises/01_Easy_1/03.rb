def missing(arr)
  result = (arr.first..arr.last).to_a
  arr.each do |num|
    result.delete(num)
  end
  result
end

# Further Exploration

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

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
