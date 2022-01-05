//
//  _70_爬楼梯.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2022/1/5.
//

import Foundation

/*
 https://leetcode-cn.com/problems/climbing-stairs/
 70. 爬楼梯
 
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。

 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶
 */

class DP_70_Solution {
    /*
     思路：本问题其实常规解法可以分成多个子问题，爬第n阶楼梯的方法数量，等于 2 部分之和
     爬上 n-1 阶楼梯的方法数量。因为再爬1阶就能到第n阶
     爬上 n-2 阶楼梯的方法数量，因为再爬2阶就能到第n阶
     
     所以我们得到公式 dp[n] = dp[n-1] + dp[n-2]
     同时需要初始化 dp[0]=1 和 dp[1]=1
     时间复杂度：O(n)O(n)
     */
    func climbStairs(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n+1)
        dp[0] = 1
        dp[1] = 1
        for i in 2..<n+1 {  // 排除n<=1的情况
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n]
    }
}
