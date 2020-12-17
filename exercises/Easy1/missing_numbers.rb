def missing(arr, new_arr = [], i = 1)
  return new_arr if i == arr.size
  
  new_arr.concat([*(arr[i - 1] + 1)...arr[i]]) unless arr[i] - arr[i - 1] == 1
  
  return missing(arr, new_arr, i + 1)
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []