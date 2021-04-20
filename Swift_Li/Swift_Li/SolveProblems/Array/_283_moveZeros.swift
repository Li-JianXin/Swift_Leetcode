//
//  _283_moveZeros.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/20.
//

/**
 https://leetcode-cn.com/problems/move-zeroes/
 
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 
 说明：
 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。
 */

import Foundation

class Array_MoveZeros_283 {
    // 需要对参数进行修改，需要用到inout关键字 调用函数时加&
    func moveZeros(_ nums:  inout [Int]) {
        // 一次遍历 使用快速排序思想，取一个中间点x,把不等于0的放左边，等于0的放右边
        var j = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                let temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
                j+=1
            }
        }
    }
    
    
    func moveZeros1(_ nums:  inout [Int]) {
        // 遍历2次 第1次遇到非0的数就移除，并记录移除的次数，在最后补0
        // 因为正序遍历动态删除元素会导致索引越界，采用倒序
        var j = 0
        for i in (0..<nums.count).reversed() {
            if nums[i] == 0 {
                nums.remove(at: i)
                j+=1
            }
        }
        
        for _ in 0..<j {
            nums.append(0)
        }
        // 时间复杂度 O(n) 空间复杂度O(n)
        
        // 优化 采用双指针法 遍历到为0的元素时不再删除元素，而是将遍历中遇到的非0元素左移,一次遍历完之后，j指向了最后一个非0元素的索引，第二次遍历从j开始置为0
    }
    
    // 1的优化 双指针法 空间复杂度O(1)
    func moveZeros2(_ nums: inout [Int]) {
        var j = 0
        var i = 0
        for num in nums {
            if num != 0 {
                nums[j] = nums[i]
                j+=1
            }
            i+=1
        }
        for a in j..<nums.count {
            nums[a] = 0
        }
    }
}
