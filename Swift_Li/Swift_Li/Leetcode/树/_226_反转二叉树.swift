//
//  _226_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/26.
//

/**
 https://leetcode-cn.com/problems/invert-binary-tree/
 226. 翻转二叉树
 */

import Foundation

class Solution226 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        let left = invertTree(root?.left)
        let right = invertTree(root?.right)
        root?.left = right
        root?.right = left
        return root
    }
}
