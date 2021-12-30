//
//  _1995_统计特殊四元组.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2021/12/29.
//

import Foundation

/*
 https://leetcode-cn.com/problems/count-special-quadruplets/
 1995. 统计特殊四元组
 给你一个 下标从 0 开始 的整数数组 nums ，返回满足下述条件的 不同 四元组 (a, b, c, d) 的 数目 ：

 nums[a] + nums[b] + nums[c] == nums[d] ，且
 a < b < c < d
 
 输入：nums = [1,2,3,6]
 输出：1
 解释：满足要求的唯一一个四元组是 (0, 1, 2, 3) 因为 1 + 2 + 3 == 6 。
 
 输入：nums = [3,3,6,4,5]
 输出：0
 解释：[3,3,6,4,5] 中不存在满足要求的四元组。
 
 输入：nums = [1,1,1,3,5]
 输出：4
 解释：满足要求的 4 个四元组如下：
 - (0, 1, 2, 3): 1 + 1 + 1 == 3
 - (0, 1, 3, 4): 1 + 1 + 3 == 5
 - (0, 2, 3, 4): 1 + 1 + 3 == 5
 - (1, 2, 3, 4): 1 + 1 + 3 == 5
 */

class Array_1995_Solution {
    // 简单解法：枚举
    // 时间复杂度：O(n^4)O(n4)，其中 nn 是数组 \textit{nums}nums 的长度。
    func countQuadruplets(_ nums: [Int]) -> Int {
        var res:Int = 0
        for a in 0..<nums.count {
            for b in a+1..<nums.count {
                for c in b+1..<nums.count {
                    for d in c+1..<nums.count {
                        if nums[a] + nums[b] + nums[c] == nums[d] {
                            res += 1
                        }
                    }
                }
            }
        }
        return res
    }
}
