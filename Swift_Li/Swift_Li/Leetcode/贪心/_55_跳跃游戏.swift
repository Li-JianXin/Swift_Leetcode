//
//  _55_跳跃游戏.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2022/1/18.
//

import Foundation

/*
 https://leetcode-cn.com/problems/jump-game/
 55. 跳跃游戏
 
 给定一个非负整数数组 nums ，你最初位于数组的 第一个下标 。
 数组中的每个元素代表你在该位置可以跳跃的最大长度。
 判断你是否能够到达最后一个下标。
 
 输入：nums = [2,3,1,1,4]
 输出：true
 解释：可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。
 
 输入：nums = [3,2,1,0,4]
 输出：false
 解释：无论怎样，总会到达下标为 3 的位置。但该下标的最大跳跃长度是 0 ， 所以永远不可能到达最后一个下标。
 */

class Solution_55 {
    func canJump(_ nums: [Int]) -> Bool {
        var farthest = 0 // 能跳的最远距离，如果最远距离能超过最后一格，则返回true
        for i in 0..<(nums.count - 1) {
            farthest = max(farthest, i + nums[i])  // i表示当前所在的格子，num[i]是在i格子上最多能走几步
            // 碰到0就卡住跳不动了 如果在当前格子上能走的最大步数还是i或者比i还小，说明不能再往前跳了，被卡住
            if farthest <= i {
                return false
            }
        }
        return farthest >= nums.count - 1
    }
}
