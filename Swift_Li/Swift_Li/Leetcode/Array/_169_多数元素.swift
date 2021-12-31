//
//  _169.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/3.
//

/**
 https://leetcode-cn.com/problems/majority-element/
 169. 多数元素
 给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。
 你可以假设数组是非空的，并且给定的数组总是存在多数元素。
 */

/*理解：
 https://leetcode-cn.com/problems/shu-zu-zhong-chu-xian-ci-shu-chao-guo-yi-ban-de-shu-zi-lcof/solution/mian-shi-ti-39-shu-zu-zhong-chu-xian-ci-shu-chao-3/
 */

import Foundation

class Array_69_Solution {
    // 摩尔投票法
    // 每轮假设发生 票数和=0=0 都可以 缩小剩余数组区间 。当遍历完成时，最后一轮假设的数字即为众数。
    func majorityElement(_ nums: [Int]) -> Int {
         var count = 0
         var candidate: Int?
         
         for i in 0..<nums.count {
             if count == 0 {
                 candidate = nums[i]
             }
             count += (nums[i] == candidate!) ? 1 : -1;
         }
         return candidate!
     }
}
