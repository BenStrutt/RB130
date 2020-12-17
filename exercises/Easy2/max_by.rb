def max_by(arr)
  return nil if arr.empty?
  
  max_val = yield(arr[0])
  max_element = arr[0]
  i = 0
  
  until i == arr.size
    val = yield(arr[i])
    if val > max_val
      max_val = val
      max_element = arr[i]
    end
    i += 1
  end
  
  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil