//
//  _509_斐波那契数.swift
//  Swift_Li
//
//  Created by 李建新 on 2022/1/1.
//

import Foundation

/*
 https://leetcode-cn.com/problems/fibonacci-number/
 509. 斐波那契数
 
 斐波那契数，通常用 F(n) 表示，形成的序列称为 斐波那契数列 。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：
 F(0) = 0，F(1) = 1
 F(n) = F(n - 1) + F(n - 2)，其中 n > 1
 
 给你 n ，请计算 F(n) 。
 */

class DP_509_Solution {
    // 时间复杂度O(n)，f(20)相当于从1-20每个函数计算一次
    func fib(_ n: Int) -> Int {
        // 使用数组做备忘录，用哈希表（字典）也是一样的思路
        var memoAry = [Int](repeating: 0, count: n + 1)  // 使n和索引一致，所以+1
        return helper(&memoAry, n)
       
    }
    func helper(_ memoAry:inout [Int], _ n: Int) -> Int {
        if (n == 0 || n == 1) {
            return n;
        }
        if memoAry[n] != 0 {
            return memoAry[n]
        } else {
            let fibValue = fib(n - 1) + fib(n - 2)
            memoAry[n] = fibValue
            return fibValue
        }
    }
    
    // 使用DP思想  在DP tabl这张表上完成「自底向上」的推算
    func fib_dp(_ n: Int) -> Int {
        if (n == 0 || n == 1) {
            return n;
        }
        var dp = [Int](repeating: 0, count: n+1)
        dp[0] = 0
        dp[1] = 1
        for i in 2...n {
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n]
    }
    
    
    // 不使用备忘录，暴力递归，产生大量重复计算
    func fib1(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return n
        }
        return fib1(n - 1) + fib1(n - 2)
    }
}
