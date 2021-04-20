//
//  _xx_searchInset.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/12.
//

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
