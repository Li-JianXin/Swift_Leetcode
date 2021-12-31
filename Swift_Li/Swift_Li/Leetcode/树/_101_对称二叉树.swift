//
//  _101_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/12.
//

/**
 https://leetcode-cn.com/problems/symmetric-tree/
 101. 对称二叉树
 给定一个二叉树，检查它是否是镜像对称的。
 */

import Foundation

class Tree_101_Solution {
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return check(root, root)
    }
    func check(_ l: TreeNode?, _ r: TreeNode?) -> Bool {
        if l == nil && r == nil {
            return true
        }
        if l == nil || r == nil {
            return false
        }
        return l?.val == r?.val && check(l?.left, r?.right) && check(l?.right, r?.left)
    }
}
