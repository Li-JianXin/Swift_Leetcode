//
//  _121_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/6.
//

/**
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/
 121. 买卖股票的最佳时机
 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
 */

import Foundation

class DP_121_Solution {
    /**
     此题可以使用暴力法 时间复杂度O(n^2)
     dp思路只需要一次遍历，时间复杂度O(n)
     也可以用单调增的栈来解决
     */
    func maxProfit(_ prices: [Int]) -> Int {
        var minprice = Int.max  // 假设的最低股价（最低买入点）
        var maxprofit = 0  // 最大利润
        for i in 0..<prices.count {
            if prices[i] < minprice {
                minprice = prices[i]
            } else if prices[i] - minprice > maxprofit {
                maxprofit = prices[i] - minprice
            }
        }
        return maxprofit
    }
}
