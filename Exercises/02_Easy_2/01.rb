def step(st, en, step)
  num = st
  loop do
    yield(num) if block_given?
    break if num + step > en
    num += step
  end
  num
end

step(1, 10, 3) { |value| puts "value = #{value}" }
