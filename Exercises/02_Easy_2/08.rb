def max_by(arr)
  return nil if arr.empty?
  index_max = 0
  value_max = yield(arr.first)
  index = 1
  while index < arr.size
    value_current = yield(arr[index])
    if value_current > value_max
      index_max = index
      value_max = value_current
    end
    index += 1
  end
  arr[index_max]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
