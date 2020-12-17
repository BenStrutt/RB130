items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*first, second|
  puts first.join(', ')
  puts second
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |first, *second, third|
  puts first
  puts second.join(', ')
  puts third
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |first, *second|
  puts first
  puts second.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do |first, second, third, fourth|
  puts "#{first}, #{second}, #{third}, #{fourth}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!