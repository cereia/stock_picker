# buy has to come before sell, so you can only sell on days after you buy
  # when buy value is determined, remove values from before buy day (index) to determine sell day
# days start from 0

# index of buy day is always lower than index of sell day
# set inital buy date to 0 and sell date to 1
# compare array[sell] - array[buy] until you have the highest difference where buy < sell

# check if array[sell] < i --> set sell = i if true
# if i < array[buy]
# check if array[i + n] - array[i] > array[sell] - array[buy] ---> set new buy, sell if true
# 

def stock_picker(array)
  # if min val of the array is not at the end of the array, set it to buy_index
  if array.find_index(array.min) != array.length - 1 
    buy_index = array.find_index(array.min)
    # p buy_index
  else
    sliced = array[0...array.find_index(array.min)]
    sliced_buy_index = sliced.find_index(sliced.min)
    buy_index = array.find_index(sliced[sliced_buy_index])
    # p buy_index
  end
  # if max val of the array is not at the beginning of the array, set it to sell_index
  if array.find_index(array.max) != 0
    sell_index = array.find_index(array.max)
  else 
    sliced = array[1...-1]
    sliced_sell_index = sliced.find_index(sliced.max)
    sell_index = array.find_index(sliced[sliced_sell_index])
    # p sell_index
  end

  result = []
  if buy_index > sell_index
    sliced = array[0...buy_index].concat(array[(buy_index + 1)..-1]) 
    # p sliced
    # p array
    sliced_buy_index = sliced.find_index(sliced.min)
    buy_index = array.find_index(sliced[sliced_buy_index])
    if buy_index < sell_index
      result.push(buy_index, sell_index)
    else
      # recursion to make sure buy_index < sell_index
      stock_picker(sliced)
    end
  # elsif buy_index == sell_index
  #   sliced = array[0...sell_index].concat(array[(sell_index + 1)..-1])
  #   sliced_sell_index = sliced.find_index(sliced.max)
  #   p sliced_sell_index
  #   sell_index = array.find_index(sliced[sliced_sell_index])
  #   if buy_index < sell_index
  #     result.push(buy_index, sell_index)
  #   else
  #     stock_picker(sliced)
  #   end
  else
    result.push(buy_index, sell_index)
    result
  end

  # for i in array
    # p array.find_index(i)
    # p array[array.find_index(i)]
    # p array[i]
    # if (array[array.find_index(i + 1)] - array[(array.find_index(i))]) > (array[sell_index] - array[buy_index])
    #   buy_index = array.find_index(i)
    #   sell_index = array.find_index(i + 1)  
    # end
  # end
  # p buy_index
  # p sell_index

  # p array[buy_index]
  # p array[sell_index]
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
# [1, 4] 15 - 3 = 12

p stock_picker([3, 16, 8, 2, 10, 5, 12, 17, 1])
# [3, 7] 17 - 2 = 15

p stock_picker([43, 40, 32, 1, 29])
# [3, 4]

#currently discards all the min values except 40 because they're all smaller than the max value
