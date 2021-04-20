//
//  _27_removeElement.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/19.
//

import Foundation

/**
 移除元素
 https://leetcode-cn.com/problems/remove-element/
 
 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。
 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。
 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。
 */

class Array_RemoveElement_27 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        // 方法一
        // 通过遍历直接删除目录元素，返回修改后的数组长度
        // 方法一修改了数组的长度，数组在缩容器中可能改变自己的内存占用，导致空间复杂度不是O(1)
/*
        for item in nums {
            // 如果转换能够成功
            if let index = nums.firstIndex(of: item) {
                if item == val {
                    nums.remove(at: index)
                }
            }
        }
        return nums.count
 */
        
        // 方法二 双指针法 快慢指针
        // 原理 通过左右2个指针，左指针指向的都是非val的值，最后左指针索引的长度就是需要返回的数组的长度
        // 遍历的每一步，判断是不是和目标值相同，如果相同，left不动, right前移，如果不同时，left将自己当前的值换成新遍历到的值，left前移
        // right每次都前移
        /*
            1,3,4,2,4  目标4
            开始遍历
            1,3,4,2,4  left=1 right=1
            1,3,4,2,4  left=2 right=2
            1,3,4,2,4  left=2 right=3
            1,3,4,2,4  left=3 right=4
            1,3,4,2,4  left=3 right=5
         */
        var left  = 0
        var right = 0
        for i in 0..<nums.count {
            let item = nums[i]
            if val != item {
                nums[left] = item
                left += 1
            }
            right += 1
        }
        
        return left
    }
}
