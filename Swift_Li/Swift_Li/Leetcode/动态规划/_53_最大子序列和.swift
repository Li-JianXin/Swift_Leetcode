//
//  _53_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/7.
//

/**
 https://leetcode-cn.com/problems/maximum-subarray/
 53. 最大子序和
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出：6
 解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
 */

import Foundation

class Dp_53_Solution {
    // 动态规划
    /**
     动态规划的是首先对数组进行遍_当前最大连续子序列和为 sum，结果为 ans
     如果 sum > 0，则说明 sum 对结果有增益效果，则 sum 保留并加上当前遍历数字
     如果 sum <= 0，则说明 sum 对结果无增益效果，需要舍弃，则 sum 直接更新为当前遍历数字
     每次比较 sum 和 ans的大小，将最大值置为ans，遍历结束返回结果
     */
    func maxSubArray(_ nums: [Int]) -> Int {
        var res = nums.first!
        var sum = 0 // 当前子序列最大和
        /*
        for i in 0..<nums.count {
            if sum > 0 {
                sum += nums[i]
            } else {
                sum = nums[i]
            }
            res = max(res, sum)
        }
 */
        
        // 如果sum + nums[i]比nums[i]还要小，直接选择nums[i]
        for num in nums {
            sum = max(sum+num, num)
            res = max(sum, res)
        }
        return res
    }
}
