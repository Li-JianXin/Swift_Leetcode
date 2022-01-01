//
//  _322_零钱兑换.swift
//  Swift_Li
//
//  Created by 李建新 on 2022/1/1.
//

import Foundation

/*
 https://leetcode-cn.com/problems/coin-change/
 322. 零钱兑换
 
 给你一个整数数组 coins ，表示不同面额的硬币；以及一个整数 amount ，表示总金额。
 计算并返回可以凑成总金额所需的 最少的硬币个数 。如果没有任何一种硬币组合能组成总金额，返回 -1 。
 你可以认为每种硬币的数量是无限的。

 输入：coins = [1, 2, 5], amount = 11
 输出：3
 解释：11 = 5 + 5 + 1
 */

class DP_322_Solution {
    // dp
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        // dp 数组的定义：当目标金额为 i 时，至少需要 dp[i] 枚硬币凑出。
        var dp = [Int](repeating:amount+1, count: amount+1)
        // 边界
        dp[0] = 0
        // 外层 for 循环在遍历所有状态的所有取值
        for i in 0..<dp.count {
            // 内层 for 循环在求所有选择的最小值
            for coin in coins {
                if i - coin < 0 { // 目标值一硬币值 < 0，子总是无解，跳过
                    continue
                }
                dp[i] = min(dp[i], 1 + dp[i-coin])
            }
        }
        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
    
    
    func coinChange1(_ coins: [Int], _ amount: Int) -> Int {
        return dp(coins, amount)
    }
    // 定义：要凑出金额n,至少需要 dp(coins, n) 个硬币
    func dp(_ coins: [Int], _ amount: Int) -> Int {
        // 明确边界
        if amount == 0 {
            return 0
        }
        if amount < 0 {
            return -1
        }
        var res: Int = Int.max
        // 做选择，选择需要硬币最少的那个结果
        for coin in coins {
            // 计算子问题的结果
            let subProblem = dp(coins, amount - coin)
            // 子问题无解跳过
            if subProblem == -1 {
                continue
            }
            // 在问题中选择最优解，然后+1
            res = min(res, subProblem + 1)
        }
        return res == Int.max ? -1 : res
    }
}
