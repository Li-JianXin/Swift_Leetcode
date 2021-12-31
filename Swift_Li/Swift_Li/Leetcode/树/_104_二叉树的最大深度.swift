//
//  _104_二叉树的最大深度.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/12/29.
//

import Foundation

/*
 https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
 104. 二叉树的最大深度
 
 给定一个二叉树，找出其最大深度。
 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

 说明: 叶子节点是指没有子节点的节点。
 
 示例：
 给定二叉树 [3,9,20,null,null,15,7]，返回它的最大深度 3
 
 3
/ \
9  20
 /  \
15   7

 */

class Tree_104_Solution {
    // 思路：深度优先搜索 DFS
    func maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { // 终止条件，当前节点为空，高度为0，返回0
            return 0
        }
        // 求出左右子树的最大值，+1是因为从递归终止条件开始回溯后，每一层树高度要+1
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
}
