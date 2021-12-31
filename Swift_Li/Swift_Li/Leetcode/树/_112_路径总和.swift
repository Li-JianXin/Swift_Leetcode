//
//  _112.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/12.
//

/**
 https://leetcode-cn.com/problems/path-sum/
 112. 路径总和
 给你二叉树的根节点 root 和一个表示目标和的整数 targetSum ，判断该树中是否存在 根节点到叶子节点 的路径，这条路径上所有节点值相加等于目标和 targetSum 。
 叶子节点 是指没有子节点的节点。
 */

import Foundation

class Tree_112_Solution {
    // DFS 每次用targetSum减去根节点的值，判断最后的叶子节点是不是一路被减掉剩下的值
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil {
            return false
        }
        if root?.left == nil && root?.right == nil { // 叶子节点 无没有子节点了
            return root?.val == targetSum
        }
        if hasPathSum(root?.left, targetSum - root!.val) {
            return true
        }
        if hasPathSum(root?.right, targetSum - root!.val) {
            return true
        }
        return false
    }
}
