//
//  _39_组合总和.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2022/1/18.
//

import Foundation

/*
 https://leetcode-cn.com/problems/combination-sum/
 39. 组合总和
 
 给你一个 无重复元素 的整数数组 candidates 和一个目标整数 target ，找出 candidates 中可以使数字和为目标数 target 的 所有不同组合 ，并以列表形式返回。你可以按 任意顺序 返回这些组合。
 candidates 中的 同一个 数字可以 无限制重复被选取 。如果至少一个数字的被选数量不同，则两种组合是不同的。
 对于给定的输入，保证和为 target 的不同组合数少于 150 个。

 输入：candidates = [2,3,6,7], target = 7
 输出：[[2,2,3],[7]]
 解释：
 2 和 3 可以形成一组候选，2 + 2 + 3 = 7 。注意 2 可以使用多次。
 7 也是一个候选， 7 = 7 。
 仅有这两种组合。
 */

class Solution_39 {
    var res = [[Int]]()
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.count == 0 {
            return res
        }
        var sum = 0
        backtrack(candidates, 0, target, &sum)
        return res
    }
    // 路径
    var track = [Int]()
    // 回溯方法
    private func backtrack(_ candidates: [Int], _ start: Int, _ target: Int, _ sum: inout Int) {
        if sum == target {  // 找到目标
            res.append(track)
            return
        }
        if sum > target {  // 超过目标和，直接结束
            return
        }
        // 回溯算法框架
        for i in start..<candidates.count {
            // 选择
            track.append(candidates[i])
            sum += candidates[i]
            // 递归
            backtrack(candidates, i, target, &sum)  // 传i是因为元素可以重复选择
            // 撤销
            sum -= candidates[i]
            track.removeLast()
        }
    }
}
