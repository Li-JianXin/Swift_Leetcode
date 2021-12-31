//
//  _145.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/30.
//

import Foundation

/**
 https://leetcode-cn.com/problems/binary-tree-postorder-traversal/
 145.二叉树的后序遍历
 给定一个二叉树，返回它的 后序 遍历。
 */
/**
 后序：左右根
 */

class Tree_145_PostorderTraversal {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        if let root = root {
            res += postorderTraversal(root.left)
            res += postorderTraversal(root.right)
            res.append(root.val)
        } else {
            return []
        }
        return res
    }
}
