import Foundation

class StockMaximize {
    func countProfit(prices: [Int]) -> Int {
        var result = 0

        for i in 0..<prices.count {
            var temp = 0

            for j in (i + 1)..<prices.count {
                if prices[j] - prices[i] > temp {
                    temp = prices[j] - prices[i]
                }
            }

            result += temp
        }

        return result
    }
}
