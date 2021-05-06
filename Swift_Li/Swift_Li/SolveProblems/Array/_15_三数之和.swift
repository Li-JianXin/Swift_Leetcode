//
//  _15_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/6.
//

/**
 https://leetcode-cn.com/problems/3sum/
 15. 三数之和
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 */
import Foundation

class Solution {
    // 正常解暴力遍历，O(n^3)
    // 可以使用排序+双指针优化成O(n^2)
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        let nums = nums.sorted()
        var res: [[Int]] = []
        let right = nums.count-1
        for i in 0..<nums.count-2 {
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            var l = i + 1
            var r = right
            let remain = -nums[i]
            
            while l < r {
                let sumLR = nums[l] + nums[r]
                if sumLR == remain {
                    res.append([nums[i], nums[l], nums[r]])
                    // 跳过相同的值
                    while l < r && nums[l] == nums[l+1] {
                        l += 1
                    }
                    while l < r && nums[r] == nums[r-1] {
                        r -= 1
                    }
                    l += 1
                    r -= 1
                } else if sumLR < remain {
                    l += 1
                } else {
                    r -= 1
                }
            }
        }
        return res
    }
}
