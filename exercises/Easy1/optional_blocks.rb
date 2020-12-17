def compute(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

p compute(3) { |n| 5 + n } == 8
p compute('b') { |n| 'a' + n } == 'ab'
p compute(1) == 'Does not compute.'