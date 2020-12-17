def each_with_index(arr)
  i = 0
  until i == arr.size
    yield(arr[i], i)
    i += 1
  end
  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true