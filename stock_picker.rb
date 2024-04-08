# if the min is at an index greater than the max, split the array at that min
# [0...min] and [min..-1]
# with the two new arrays, find min and max of each until index of max > index of min
# when max index > min index, save their difference in a difference variable for comparison
# compare the differences of min-maxes among all the subarrays and return the highest pair
# after getting the min max combo, look through the original array for their indices in the original
# min's index doesn't matter, but look for the max index that is greater than the min index

def stock_picker(array)
  results = {}
  find_stock_pairs(array, results)

  # sort the keys from results from largest to smallest and grab first one
  key = results.keys.map { |value| value.to_i }.sort{ |a, b| b <=> a }[0].to_s
  buy_index = array.index(results[key][0])
  if results.length == 1 
    # if the hash has length = 1, that means min < max, so finding the first values that match works
    sell_index = array.index(results[key][1])
  else
    i = 0
    while i < array.length do 
      if array[i] == results[key][1] && i > buy_index
        sell_index = i 
        break
      end
      i += 1
    end
  end 
  [buy_index, sell_index]
end

# HELPER FUNCTIONS
def find_min(array)
  # set min_index to min value of the array except when the min is the last item of the array
  min_index = array.index(array.min) != array.length - 1 ? 
    array.index(array.min) : 
    # use a modified array where the last item is removed and find min
    array.index(array[0...array.index(array.min)].min)
end

def find_max(array)
  # set max_index to max value of the array except when the max is the first item of the array
  max_index = array.index(array.max) != 0 ? 
    array.index(array.max) : 
    # use a modified array where first item is removed and find max 
    array.index(array[1..-1].max)
end

def find_stock_pairs(array, hash)
  # find index of min and max values of the array passed in
  min = find_min(array)
  max = find_max(array)

  if min > max 
    # if index of min > index of max, split the array at index of the min value and test again
    sub_array1 = array[0...min]
    sub_array2 = array[min..-1]
    # recursive call to get all subarrays and collect results in single hash
    find_stock_pairs(sub_array1, hash)
    find_stock_pairs(sub_array2, hash)
  else
    # when index of min < index of max, find difference of the values
    difference = array[max] - array[min]
    # make the difference a string to be used as the key for the hash
    hash_key = difference.to_s
    hash[hash_key] = [array[min], array[max]]
    hash
  end
end


# TEST CASES 

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
# [1, 4] 15 - 3 = 12

p stock_picker([3, 16, 8, 2, 10, 5, 12, 17, 1])
# [3, 7] 17 - 2 = 15

p stock_picker([43, 40, 32, 1, 29])
# [3, 4] 29 - 1 = 28

p stock_picker([230, 72, 80, 40, 49, 70, 42, 1, 33])
# [7, 8] 33 - 1 = 32
# with a[1] = 72 and a[2] = 80, gets [1, 2]

p stock_picker([42, 34, 16, 4, 34, 3, 29, 4, 1, 30])