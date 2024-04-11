# if the min is at an index greater than the max, split the array at that min
# [0...min] and [min..-1]
# with the two new arrays, find min and max of each until index of max > index of min
# when max index > min index, save their difference in a difference variable for comparison
# compare the differences of min-maxes among all the subarrays and return the highest pair
# after getting the min max combo, look through the original array for their indices in the original
# min's index doesn't matter, but look for the max index that is greater than the min index

def stock_picker(array)
  results = {}
  stock_days = []
  find_stock_pairs(array, results)

  key = results.keys.map { |value| value.to_i }.max.to_s
  buy_index = array.index(results[key][0])
  stock_days.push buy_index
  i = 0
  while i < array.length do 
    if array[i] == results[key][1] && i > buy_index
      sell_index = i 
      stock_days.push sell_index
      break
    end
    i += 1
  end
  stock_days
end

def find_stock_pairs(array, hash)
  # find index of min and max values of the array passed in
  # remove value if min is the last index or if max is the first index
  index_of_min = array.index(array.min)
  index_of_max = array.index(array.max)

  min = index_of_min == array.length - 1 ? array.index(array[0...index_of_min].min) : index_of_min
  max = index_of_max == 0 ? array.index(array[1..-1].max): index_of_max 

  if min > max 
    # if index of min > index of max, split the array at index of the min value and test again
    find_stock_pairs(array[0...min], hash)
    find_stock_pairs(array[min..-1], hash)
  else
    # make the difference a string to be used as the key for the hash
    hash_key = (array[max] - array[min]).to_s
    hash[hash_key] = [array[min], array[max]]
    hash
  end
end


# TEST CASES 

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
# [1, 4] 15 - 3 = 12

# p stock_picker([3, 16, 8, 2, 10, 5, 12, 17, 1])
# [3, 7] 17 - 2 = 15

# p stock_picker([43, 40, 32, 1, 29])
# [3, 4] 29 - 1 = 28

# p stock_picker([230, 72, 80, 40, 49, 70, 42, 1, 33])
# [7, 8] 33 - 1 = 32

# p stock_picker([42, 34, 16, 4, 34, 3, 29, 4, 1, 30])
# [3, 4] 34 - 4 = 30