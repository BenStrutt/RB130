def step(first, last, step)
  while first <= last
    yield(first)
    first += step
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10