# buy has to come before sell, so you can only sell on days after you buy
  # when buy value is determined, remove values from before buy day (index) to determine sell day
# days start from 0

# index of buy day is always lower than index of sell day
# set inital buy date to 0 and sell date to 1
# compare array[sell] - array[buy] until you have the highest difference where buy < sell


def stock_picker(array)
  buy = 0
  sell = 1
p array[buy]
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
# [1, 4] 15 - 3 = 12

stock_picker([3, 16, 8, 2, 10, 5, 12, 17, 1])
# [3, 7] 17 - 2 = 15