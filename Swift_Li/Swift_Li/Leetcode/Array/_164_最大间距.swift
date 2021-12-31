//
//  _164_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/30.
//

/**
 https://leetcode-cn.com/problems/maximum-gap/
 164.最大间距
 给定一个无序的数组，找出数组在排序之后，相邻元素之间最大的差值。
 如果数组元素个数小于 2，则返回 0。
 */
/**
 输入: [3,6,9,1]
 输出: 3
 解释: 排序后的数组是 [1,3,6,9], 其中相邻元素 (3,6) 和 (6,9) 之间都存在最大差值 3。
 */

import Foundation

class MaximumGap {
    // 思想基数排序
    func maximumGap(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return 0
        }
        return 0
    }
}
