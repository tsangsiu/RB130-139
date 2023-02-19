### Integer#times

5.times do |num|
  puts num
end

puts

### my attempt

def times(int)
  (0...int).each do |num|
    yield(num)
  end
  int
end

times(5) { |num| puts num }
puts

### from LS

# method implementation         # 1
def times(number)               # 2
  counter = 0                   # 3
  while counter < number do     # 4
    yield(counter)              # 5
    counter += 1                # 6
  end                           # 7
                                # 8
  number                        # 9
end                             # 10
                                # 11
# method invocation             # 12
times(5) do |num|               # 13
  puts num                      # 14
end                             # 15
