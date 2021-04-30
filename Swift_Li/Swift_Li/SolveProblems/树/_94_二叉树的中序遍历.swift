//
//  _94_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/30.
//

/**
 https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
 94 二叉树的中序遍历
 给定一个二叉树的根节点 root ，返回它的 中序 遍历。
 */

/**
 中序：左根右
 */

import Foundation

class Tree_94_InorderTraversal {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        guard let root = root else {
            return []
        }
        
        res += inorderTraversal(root.left)
        res.append(root.val)
        res += inorderTraversal(root.right)

        return res
        
    }
}
