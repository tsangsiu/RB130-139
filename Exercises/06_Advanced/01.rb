### my original solution
### use only two `Enumerator` methods here: `#next` and `#rewind`
### (clearly I didn't know what's going on)

# `Enumerator` objects
enum = 0.upto(6)
enum = (0..6).to_a.to_enum

fact = nil
rewind = false
loop do
  current_num = enum.next
  fact = current_num == 0 ? 1 : fact * current_num
  puts "#{current_num}! = #{fact}"
  if current_num == 6 && rewind == false
    enum.rewind
    rewind = true
    puts "=" * 10
  end
end

puts

### after seeing the solution and study the `Enumerator` class again

# to create an `Enumerator` object that can iterate over an infinite list of factorials
factorial = Enumerator.new do |yielder|
  fact = 1
  num = 0
  loop do
    fact = num == 0 ? 1 : fact * num
    yielder << fact
    num += 1
  end
end

7.times { |num| puts "#{num}! = #{factorial.next}" }
puts "=" * 10
factorial.rewind
7.times { |num| puts "#{num}! = #{factorial.next}" }
puts

# internal iterator
# automatically calls `rewind`
factorial.each_with_index do |fact, num|
  puts "#{num}! = #{fact}"
  break if num > 5
end
