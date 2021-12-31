//
//  _70_climbStairs.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/21.
//

/**
 https://leetcode-cn.com/problems/climbing-stairs/
 爬楼梯
 
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 注意：给定 n 是一个正整数。
 
 示例 1：
 输入： 2
 输出： 2
 
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 */

import Foundation

class Recursion_ClimbStairs_70 {
    /**
     解法一：斐波那契数列公式
     
     解法二：动态规划
     爬第n阶楼梯的方法数量，等于 2 部分之和
     1爬上n-1阶楼梯的方法数量。因为再爬1阶就能到第n阶
     1爬上n-2阶楼梯的方法数量。因为再爬2阶就能到第n阶
     */
    func climbStairs2(_ n: Int) -> Int {
        // 每次只走1个或2个楼梯，最后一步也是只能走2步或者1步
        // 复用递归思想，当前方法climbStaris就是走n个台阶的走法
        if n <= 2 { // 递归的终止条件
            return n
        }
        return climbStairs2(n-1) + climbStairs2(n-2)
    }
    
    // 动态规划
    func climStaires(_ n: Int) -> Int {
        var dp: [Int] = Array.init(repeating: 0, count: n+1)
         dp[0] = 1
         dp[1] = 1
         for i in 2...n {
             dp[i] = dp[i - 1] + dp[i - 2]
         }
         return dp[n]
    }
    
    
}
