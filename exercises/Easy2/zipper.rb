def zip(arr1, arr2)
  result = []
  [*0...arr1.size].each { |i| result << [arr1[i], arr2[i]] }
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]