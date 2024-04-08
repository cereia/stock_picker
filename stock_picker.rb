# check to make sure that the min and max values are not at the ends of the array --> auto reject
# then look for the min and max of what's left after removing the ends 
# if the min is at an index greater than the max, split the array at that min
# [0...min] and [min..-1]
# with the two new arrays, find min and max of each until index of max > index of min
# when max index > min index, save their difference in a difference variable for comparison
# compare the differences of min-maxes among all the subarrays and save and return the highest pair
# after getting the min max combo, look through the original array for their indices in the original
# min doesn't matter, but look for the max index that is greater than the min index 
# --> array.index() / array.find_index() return first match
    # use a while loop with an if?
    # i = 0
    # while i < array.length do 
    #   if array[i] == max && i > buy_index 
    #     sell_index = i 
    #     break
    #   end
    # end

def stock_picker(array)
  min_index = find_min(array)
  max_index = find_max(array)
  p min_index
  p max_index
  results = {}

  if min_index > max_index 
    sub_array1 = array[0...min_index]
    p sub_array1
    sub_array2 = array[min_index..-1]
    p sub_array2
    stock_picker(sub_array1)
    stock_picker(sub_array2)
  else
    difference = array[max_index] - array[min_index]
    results_key = difference.to_s
    # result = []
    # result.push(min_index, max_index)
    # make the difference between the values the key and the values themselves the array
    # this makes it easier to find their indices in the original array easier 
    results[results_key] = [array[min_index], array[max_index]]
    p results
  end
  # p results.keys

  # p min_index
  # p max_index

  # p array[min_index]
  # p array[max_index]
end

def find_min(array)
  min_index = array.index(array.min) != array.length - 1 ? 
    array.index(array.min) : 
    array.index(array[0...array.index(array.min)].min)
end

def find_max(array)
  max_index = array.index(array.max) != 0 ? 
    array.index(array.max) : 
    array.index(array[1..-1].max)
end

# p find_min_max([230, 72, 80, 40, 49, 70, 42, 1, 33])

# TEST CASES 

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
# [1, 4] 15 - 3 = 12

# stock_picker([3, 16, 8, 2, 10, 5, 12, 17, 1])
# [3, 7] 17 - 2 = 15

# p stock_picker([43, 40, 32, 1, 29])
# [3, 4] 29 - 1 = 28

#currently discards all the min values except 40 because they're all smaller than the max value

# p stock_picker([230, 72, 80, 40, 49, 70, 42, 1, 33])
# [7, 8] 33 - 1 = 32
# with a[1] = 72 and a[2] = 80, gets [1, 2]