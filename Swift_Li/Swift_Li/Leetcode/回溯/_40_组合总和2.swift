//
//  _40_组合总和2.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2022/1/18.
//

import Foundation

/*
 https://leetcode-cn.com/problems/combination-sum-ii/
 40. 组合总和 II
 
 给你一个由候选元素组成的集合 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 candidates 中的每个元素在每个组合中只能使用 一次 。
 注意：解集不能包含重复的组合。
 
 输入: candidates = [10,1,2,7,6,1,5], target = 8,
 输出:
 [
 [1,1,6],
 [1,2,5],
 [1,7],
 [2,6]
 ]
 */

class Solution_40 {
    /*
     这题和39题基本是一样的，区别是39可以在数组中重复选择元素，而本题不可以
     还是回溯的思想, 重点是如何去掉重复的集合
     
     元素在同一个组合内是可以重复的，怎么重复都没事，但两个组合不能相同。所以我们要去重的是同一树层上的“使用过”，同一树枝上的都是一个组合里的元素，不用去重。
     */
    var res = [[Int]]()
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.count == 0 {
            return res
        }
        // 在求和问题中，要去重，先排序是常见的套路！
        let candidates = candidates.sorted()
        var sum = 0
        backtrack(candidates, target, 0, &sum)
        return res
    }
    var track = [Int]()  // 路径
    private func backtrack(_ candidates: [Int], _ target: Int, _ start: Int, _ sum: inout Int) {
        // 递归终止条件
        if target == sum {
            res.append(track)
            return
        }
        if sum > target {
            return
        }
        for i in start..<candidates.count {
            // 因为不能包含相同的元素,需要对树同一层相同的元素剪枝
            if i > start && candidates[i] == candidates[i-1] {  // 理解：每次for循环第一次开始的时候，是在做树的第一次选择。如果本次选择之前有同层相同的选择，则可以剪枝
                continue
            }
            // 从选择列表中选择
            track.append(candidates[i])
            sum += candidates[i]
            // 递归
            backtrack(candidates, target, i + 1, &sum)
            // 回溯 （理解为树的一整条路径遍历完，也就是上面的backtrack执行完，触发了终止条件，开始回溯）
            sum -= candidates[i]
            track.removeLast()
        }
    }
    
}
