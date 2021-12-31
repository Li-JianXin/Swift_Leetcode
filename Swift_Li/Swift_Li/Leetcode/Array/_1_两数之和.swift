//
//  _1_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/30.
//

/**
 https://leetcode-cn.com/problems/two-sum/
 1.两数之和
 
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 [和为目标值] 的那 [两个] 整数，并返回它们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。
 你可以按任意顺序返回答案
 */
/**
 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1]
 */

import Foundation

// [3,2,4] 6
class TwoSum_1 {
    // 常规方法 暴力遍历 O(n^2)
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] +  nums[j] == target {
                    return [i,j]
                }
            }
        }
        return []
    }
    
    // 哈希表
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var map:[Int: Int] = [:]
        for i in 0..<nums.count {
            let num = nums[i]
            if let index = map[target-num] {
                return [index, i]
            } else {
                map[num] = i
            }
        }
        return []
    }
}
