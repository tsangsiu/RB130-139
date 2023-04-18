def compute
  if block_given?
    yield
  else
    "Does not compute."
  end
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further Exploration

def compute(prompt)
  if block_given?
    yield(prompt)
  else
    "#{prompt}Does not compute."
  end
end

puts compute(">> ") { |prompt| "#{prompt}#{5 + 3}" }
puts compute(">> ") { |prompt| "#{prompt}#{'a' + 'b'}" }
puts compute(">> ")
