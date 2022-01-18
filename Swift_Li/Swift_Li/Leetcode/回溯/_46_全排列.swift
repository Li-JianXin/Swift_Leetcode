//
//  _46_全排列.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2022/1/18.
//

import Foundation

/*
 回溯法 采用试错的思想，它尝试分步的去解决一个问题。
 在分步解决问题的过程中，当它通过尝试发现现有的分步答案不能得到有效的正确的解答的时候，它将取消上一步甚至是上几步的计算，再通过其它的可能的分步解答再次尝试寻找问题的答案。
 回溯法通常用最简单的递归方法来实现，在反复重复上述的步骤后可能出现两种情况：

 * 找到一个可能存在的正确的答案；
 * 在尝试了所有可能的分步方法后宣告该问题没有答案。
 
 回溯算法框架
 var list
 func backtrack(路径，选择列表) {
    if 满足条件
        result.append(路径)
        return
    for(选择 : 选择列表) {
        做选择
        backtrack(路径，选择列表)   // 递归
        撤销选择
    }
 }
 */

/*
 https://leetcode-cn.com/problems/permutations/
 46. 全排列
 给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。

 输入：nums = [1,2,3]
 输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 */

class Solution_46 {
    var res = [[Int]]()
    // 时间复杂度 O(n!) * O(n^2)
    func permute(_ nums: [Int]) -> [[Int]] {
        // 使用一个动态数组保存所有可能的全排列
        guard nums.count != 0 else {  // guard 和 if 条件是相反的，guard可以更明确当前要求的条件
            return res
        }
        var track = [Int]()  // 路径
        backTrack(nums, &track)
        return res
    }
    
    private func backTrack(_ nums: [Int], _ track: inout [Int]) {  // 选择列表 路径
        // 结束条件
        if track.count == nums.count {
            res.append(track)
            return
        }
        // for 循环时间复杂度 O(n^2)
        for i in 0..<nums.count {  // 选择 ： 选择列表
            // 排队不合法的选择
            if track.contains(nums[i]) {  // 比如路径是1，待选择是2，3。此时nums是[2,3]，如包含1是不合法选择
                continue
            }
            // 做选择
            track.append(nums[i])
            // 进入下一层决策树
            backTrack(nums, &track)  // 递归之前做选择，递归之后回溯 (不要人肉递归，而是明白方法本身含义)
            // 取消选择
            track.removeLast()
        }
    }
    
}
