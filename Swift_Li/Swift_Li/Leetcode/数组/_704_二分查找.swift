//
//  _xx_searchInset.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/12.
//

/**
 https://leetcode-cn.com/problems/binary-search/
 给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。
 输入: nums = [-1,0,3,5,9,12], target = 9
 输出: 4
 解释: 9 出现在 nums 中并且下标为 4
 */

import Foundation

// 2分查找
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    if nums.last! < target {
        return nums.count
    }
    if nums.first! > target {
        return 0
    }
    
    while left <= right {
        let mid = left + (right - left) / 2
        if nums[mid] == target {
            return mid
        } else if nums[mid] > target {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return left
    
}
