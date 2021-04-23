//
//  _75_sortColors.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/23.
//

/**
 https://leetcode-cn.com/problems/sort-colors/
 颜色分类  荷兰国旗问题
 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
 */
/**
 输入：nums = [2,0,2,1,1,0]
 输出：[0,0,1,1,2,2]
 */

import Foundation

class SortColors_75 {
    func sortColors(_ nums: inout [Int]) {
        // 不管n有多少，一共就3类，用0，1，2表示 表示白色的1在中间  2在右边
        // 通过遍历 将0放左边 1放右边
        var left = 0
        // 将所有的0都交换到左边了
        for i in 0..<nums.count {
            if nums[i] == 0 {
                let temp = nums[left]
                nums[left] = nums[i]
                nums[i] = temp
                left += 1
            }
        }
        // 认为0组成的区域已经完成排序 从非0区开始排序1 排序1的思路和排序0一样
        for i in left..<nums.count {
            if nums[i] == 1 {
                let temp = nums[left]
                nums[left] = nums[i]
                nums[i] = temp
                left += 1
            }
        }
    }
    
    func sortColors1(_ nums: inout [Int]) {
        // 双指针法
        var left = 0
        var right = nums.count - 1
        var i = 0
        while i <= right {
            if nums[i] == 0 {
                nums.swapAt(left, i)
                left += 1
                i += 1
            } else if nums[i] == 1 {
                i += 1
            } else if nums[i] == 2 {
                nums.swapAt(right, i)
                right -= 1
            }
        }
    }
}
