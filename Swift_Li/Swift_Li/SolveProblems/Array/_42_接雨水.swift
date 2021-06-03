//
//  _42_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/6/3.
//


/**
 https://leetcode-cn.com/problems/trapping-rain-water/
 42. 接雨水
 */
import Foundation

class Solution_42 {
    func trap(_ height: [Int]) -> Int {
            if height == nil || height.count == 0 || height.count == 1 {
                return 0
            }
            var res = 0
            // 最左和最右因为没有左右边界的柱子，所有无法存水
            for i in 1..<height.count-1 {
                // 左右最高柱子
                var l_max = 0
                var r_max = 0
                // 左边最高的柱子
                for l in 0..<i {
                    l_max = max(l_max, height[l])
                }
                // 右边最高的柱子
                for r in i+1..<height.count {
                    r_max = max(r_max, height[r])
                }
                // 左右最高柱子中低的那个
                let lr_min = min(l_max, r_max)
                // 较低的柱子减去当前柱子的高度，就是柱子上能存水的大小
                if lr_min > height[i] {
                    res += (lr_min - height[i])
                }
            }
            return res
        }}
