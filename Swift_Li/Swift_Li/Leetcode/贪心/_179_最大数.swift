//
//  _179_最大数.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2022/1/12.
//

import Foundation

/*
 https://leetcode-cn.com/problems/largest-number/
 179. 最大数
 
 给定一组非负整数 nums，重新排列每个数的顺序（每个数不可拆分）使之组成一个最大的整数。
 注意：输出结果可能非常大，所以你需要返回一个字符串而不是整数
 
 输入：nums = [10,2]
 输出："210"
 */

class Solution_179 {
    /*
     思路是贪心，比较每个元素组合起来的最大值，然后排序，一步步得到可以组成最大值的数组顺序 
     */
    func largestNumber(_ nums: [Int]) -> String {
        if nums.count == 0 {
            return ""
        }
        let sortNums = nums.sorted { a, b in
            return String(a) + String(b) > String(b) + String(a)
        }
        if sortNums.first == 0 {
            return "0"
        }
        var res = String()
        for num in sortNums {
            res = res + String(num)
        }
        return res;
        // reduce函数把数组合并为字符串
        // return sortNums.reduce("", { $0 + String($1) })
        /*
         reduce的作用给定一个类型为U的初始值，把数组[T]中每一个元素传入到combine的闭包函数里面，通过计算得到最终类型为U的结果值。定义如下：
         func reduce(initial: U, combine: (U, T) -> U) -> U
         */
    }
}
