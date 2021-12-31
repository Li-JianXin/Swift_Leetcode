//
//  Offer_39_MajorityElement.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/3.
//

import Foundation

/**
 https://leetcode-cn.com/problems/shu-zu-zhong-chu-xian-ci-shu-chao-guo-yi-ban-de-shu-zi-lcof/
 剑指 Offer 39. 数组中出现次数超过一半的数字
 数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。
 你可以假设数组是非空的，并且给定的数组总是存在多数元素。
 https://leetcode-cn.com/problems/majority-element/
 */

/**
 输入: [1, 2, 3, 2, 2, 2, 5, 4, 2]
 输出: 2
 */

class Offer_MajorityElement_39 {
    // 数组中出现超过一半的数字，简称为众数
    // 解法：1哈希表统计法
    // 2排序：中点的元素一定是众数
    // 3摩尔投票法： 核心理念为 票数正负抵消 。此方法时间和空间复杂度分别为O(N)和O(1) 最佳解法
    func majorityElement(_ nums: [Int]) -> Int {
        // 哈希表统计法
        var map: [Int: Int] = [:]
        for i in 0..<nums.count {
            let num = nums[i]
            if map.keys.contains(num) {
                if map[num]! > nums.count / 2 {
                    return num
                } else {
                    map[num] = map[num]! + 1
                }
            } else {
                map[num] = 1
            }
        }
        for (key, value) in map {
            if value > nums.count / 2 {
                return key
            }
        }
        return 0
    }
    
    // 摩尔投票法
    // 每轮假设发生 票数和=0=0 都可以 缩小剩余数组区间 。当遍历完成时，最后一轮假设的数字即为众数。
    func majorityElement1(_ nums: [Int]) -> Int {
        var count = 0
        var candidate: Int?
        
        for i in 0..<nums.count {
            if count == 0 {
                // 如果count是0，向后移区间
                candidate = nums[i]
            }
            // 判断nums[i]是不是假设的众数
            count += (nums[i] == candidate!) ? 1 : -1;
        }
        return candidate!
    }
}
