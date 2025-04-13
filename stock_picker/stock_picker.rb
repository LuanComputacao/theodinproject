# frozen_string_literal: true

def stock_picker(stock_prices)
  min_price = stock_prices[0]
  min_price_i = 0
  best_profit = 0
  trade_index = [0, 0]

  stock_prices.each_with_index do |price, i|
    if price < min_price
      min_price = price
      min_price_i = i
    end

    profit = price - min_price

    next unless profit > best_profit && i > min_price_i

    best_profit = profit
    trade_index = [min_price_i, i]
  end
  trade_index
end
