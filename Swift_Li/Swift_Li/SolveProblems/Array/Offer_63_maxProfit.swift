//
//  Offer_63_maxProfit.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/28.
//

/**
 股票的最大利润
 https://leetcode-cn.com/problems/gu-piao-de-zui-da-li-run-lcof/
 */
/*
 输入: [7,1,5,3,6,4]
 输出: 5
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
 */

// [1,2,3,4,5,6]
import Foundation

class MaxProfit_65 {
    func maxProfit(_ prices: [Int]) -> Int {
        // 暴力法 两两比较，保存计算的最大值 O(n^2)
        var profit = 0
        for i in 0..<prices.count {
            for j in (i+1)..<prices.count {
                if prices[j] > prices[i] {
                    profit = max(profit, prices[j] - prices[i])
                }            }
        }
        return profit
    }
    
    func maxProfit1(_ prices: [Int]) -> Int {
        // 贪心 因为股票就买卖一次，那么贪心的想法很自然就是取最左最小值，取最右最大值，那么得到的差值就是最大利润。
        var low = Int.max
        var result = 0
        for i in 0..<prices.count {
            low = min(low, prices[i])  // 左边最小的价格
            result = max(result, prices[i] - low)  // 直接获取最大区间利润
        }
        return result
    }
}
