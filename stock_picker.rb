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
  # if min val of the array is not at the end of the array, set it to buy_index
  min_index = array.find_index(array.min)
  max_index = array.find_index(array.max)

  if min_index != array.length - 1 
    buy_index = min_index
  else
    sliced = array[0...min_index]
    sliced_buy_index = sliced.find_index(sliced.min)
    buy_index = array.find_index(sliced[sliced_buy_index])
  end

  # if max val of the array is not at the beginning of the array, set it to sell_index
  if max_index != 0
    sell_index = max_index
  else 
    sliced = array[1..-1]
    sliced_sell_index = sliced.find_index(sliced.max)
    sell_index = array.find_index(sliced[sliced_sell_index])
  end

  # result = []
  # if buy_index > sell_index
  #   sliced = array[0...buy_index].concat(array[(buy_index + 1)..-1]) 
  #   # p sliced
  #   # p array
  #   sliced_buy_index = sliced.find_index(sliced.min)
  #   buy_index = array.find_index(sliced[sliced_buy_index])
  #   if buy_index < sell_index
  #     result.push(buy_index, sell_index)
  #   else
  #     # recursion to make sure buy_index < sell_index
  #     stock_picker(sliced)
  #   end
  # # elsif buy_index == sell_index
  # #   sliced = array[0...sell_index].concat(array[(sell_index + 1)..-1])
  # #   sliced_sell_index = sliced.find_index(sliced.max)
  # #   p sliced_sell_index
  # #   sell_index = array.find_index(sliced[sliced_sell_index])
  # #   if buy_index < sell_index
  # #     result.push(buy_index, sell_index)
  # #   else
  # #     stock_picker(sliced)
  # #   end
  # else
  #   result.push(buy_index, sell_index)
  #   result
  # end
  # p result
  results = {}

  if buy_index > sell_index 
    sub_array1 = array[0...buy_index]
    p sub_array1
    sub_array2 = array[buy_index..-1]
    p sub_array2
    stock_picker(sub_array1)
    stock_picker(sub_array2)
  else
    difference = array[sell_index] - array[buy_index]
    results_key = difference.to_s
    # result = []
    # result.push(buy_index, sell_index)
    # make the difference between the values the key and the values themselves the array
    # this makes it easier to find their indices in the original array easier 
    results[results_key] = [array[buy_index], array[sell_index]]
    p results
  end
  # p results.keys

  # p buy_index
  # p sell_index

  # p array[buy_index]
  # p array[sell_index]
end

# p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
# [1, 4] 15 - 3 = 12

# stock_picker([3, 16, 8, 2, 10, 5, 12, 17, 1])
# [3, 7] 17 - 2 = 15

# p stock_picker([43, 40, 32, 1, 29])
# [3, 4] 29 - 1 = 28

#currently discards all the min values except 40 because they're all smaller than the max value

p stock_picker([230, 72, 80, 40, 49, 70, 42, 1, 33])
# [7, 8] 33 - 1 = 32
# with a[1] = 72 and a[2] = 80, gets [1, 2]