//
//  _961_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/16.
//
// https://leetcode-cn.com/problems/n-repeated-element-in-size-2n-array/
// 在大小为 2N 的数组 A 中有 N+1 个不同的元素，其中有一个元素重复了 N 次。
// 返回重复了 N 次的那个元素。

import Foundation

class Array_961_Solution {
    // 比较法
    func repeatedNTimes(_ nums: [Int]) -> Int {
        for i in 0..<nums.count-1 {
            for j in i+1..<nums.count {
                if nums[i] == nums[j] {
                    return nums[i]
                }
            }
        }
        return 0
    }
    
    func repeatedNTimes1(_ nums: [Int]) -> Int {
        // 哈希优化
        var map: [Int: Int] = [:]
        for num in nums {
            if let count = map[num] {
                map[num] = (count + 1)
                return num
            } else {
                map[num] = 1
            }
        }
        return 0
    }
    
    func repeatedNTimes2(_ nums: [Int]) -> Int {
        // 哈希
        var map: [Int: Int] = [:]
        for num in nums {
            if let count = map[num] {
                map[num] = (count + 1)
            } else {
                map[num] = 1
            }
        }
        for (num, count) in map {
            if count == nums.count / 2 {
                return num
            }
        }
        return 0
    }
}
