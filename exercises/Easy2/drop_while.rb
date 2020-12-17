def drop_while(arr)
  result = []
  i = 0
  
  until i == arr.size
    break unless yield(arr[i])
    i += 1
  end
  
  until i == arr.size
    result << arr[i]
    i += 1
  end
  
  result
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []