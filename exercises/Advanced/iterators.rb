def factorial(n)
  return 1 if n < 2
  
  counter = n
  n -= 1
  until n == 1
    counter *= n
    n -= 1
  end
  
  counter
end

fact = Enumerator.new do |y|
  counter = 0
  
  loop do
    y.yield(factorial(counter))
    counter += 1
  end
end

7.times { puts fact.next }
puts "============================"
3.times { puts fact.next }
fact.rewind
7.times { puts fact.next }