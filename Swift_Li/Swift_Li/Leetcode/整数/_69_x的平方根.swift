//
//  _66_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/7.
//

/**
 https://leetcode-cn.com/problems/sqrtx/
 69. x 的平方根
 实现 int sqrt(int x) 函数。
 计算并返回 x 的平方根，其中 x 是非负整数。
 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。
 输入: 4
 输出: 2
 输入: 8
 输出: 2
 说明: 8 的平方根是 2.82842...,
      由于返回类型是整数，小数部分将被舍去。
 */

import Foundation

class Sqrt_69_Solution {
    // 2分查找
    // 如果一个数a的平方大于x，那么a一定不是x的平方根，所以下一轮需要在[0...a-1]区间里查找x的平方根
    func mySqrt(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }
        if x == 1 {
            return 1
        }
        var left = 1
        var right = x / 2
        while left < right {
            let mid = left + (right - left + 1) / 2
            // 避免乘法溢出，改用除法
            if mid > (x / mid) {  // 算法核心 mid的平方和x比较 如果mid的平方大于x，则mid是偏大的数
                right  = mid - 1
            } else {
                left = mid
            }
        }
        return left
    }
}
