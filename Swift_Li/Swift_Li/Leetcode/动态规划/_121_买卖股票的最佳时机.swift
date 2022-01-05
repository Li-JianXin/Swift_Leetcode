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
     只能买卖一次
     */
    func maxProfit(_ prices: [Int]) -> Int {
        // 一次遍历,计算到当天为止的最小股票和最大利润
        var minprice = Int.max  // 假设的最低股价（最低买入点）
        var maxprofit = 0  // 最大利润
        for i in 0..<prices.count {
            if prices[i] < minprice { // 如果当天股票价格比最低点要低，更新最低点价格
                minprice = prices[i]
            } else if prices[i] - minprice > maxprofit { // 如果当天股票价格-最低点 > 最大利润
                maxprofit = prices[i] - minprice  // 更新最大利润
            }
        }
        return maxprofit
    }
    
    /*
     方法二：动态规划
     1. 动态规划做题步骤

     明确 dp(i) 应该表示什么（二维情况：dp(i)(j))；
     根据 dp(i) 和 ddp(i−1) 的关系得出状态转移方程；
     确定初始条件，如 dp(0)。

     链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/solution/gu-piao-wen-ti-python3-c-by-z1m/
     
     2. 本题思路

     其实方法一的思路不是凭空想象的，而是由动态规划的思想演变而来。这里介绍一维动态规划思想。
     dp[i] 表示前 i 天的最大利润，因为我们始终要使利润最大化，则：

     dp[i] = max(dp[i-1], prices[i]-minprice)
     
     */
    func maxProfit_dp(_ prices: [Int]) -> Int {
        let n = prices.count
        guard n != 0 else {
            return 0
        }
        var minprice = prices[0]  // 最低买入价
        var dp = [Int](repeating: 0, count: n)
        for i in 1..<n {
            minprice = min(minprice, prices[i])
            dp[i] = max(dp[i - 1], prices[i] - minprice)  // 上一天的最大收益价格和今天能获取的最大收益价格，取大值
        }
        return dp[n - 1]
    }
    
    
    
    // 时间复杂度：O(n)。
     //空间复杂度：O(n)
}
