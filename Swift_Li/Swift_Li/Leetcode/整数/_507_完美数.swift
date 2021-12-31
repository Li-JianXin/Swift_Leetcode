//
//  _507_完美数.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2021/12/31.
//

import Foundation

/*
 https://leetcode-cn.com/problems/perfect-number/
 507. 完美数
 
 对于一个 正整数，如果它和除了它自身以外的所有 正因子 之和相等，我们称它为 「完美数」。
 给定一个 整数 n， 如果是完美数，返回 true，否则返回 false
 
 输入：num = 28
 输出：true
 解释：28 = 1 + 2 + 4 + 7 + 14
 1, 2, 4, 7, 和 14 是 28 的所有正因子。
 
 输入：num = 6
 输出：true
 */

class Solution_507 {
    // 我们知道正因数总是成对的出现，因此我们可以仅枚举每队正因数的较小数，即从 [1, \sqrt{num}][1,num] 范围内进行枚举（其中 nums > 1nums>1）。
    // 同时为避免使用 sqrt 库函数和溢出，使用 i <= \frac{num}{i}i<=inum作为上界判断。
    func checkPerfectNumber(_ num: Int) -> Bool {
        if num == 1 {
            return false
        }
        var sum = 1
        var d = 2
        while d*d <= num {
            if num % d == 0 {
                sum += d
                if d * d < num {
                    sum += (num / d)
                }
            }
            d += 1
        }
        return sum == num
    }
}
