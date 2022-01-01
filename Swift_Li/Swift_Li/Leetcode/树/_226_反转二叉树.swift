//
//  _226_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/26.
//

/**
 https://leetcode-cn.com/problems/invert-binary-tree/
 226. 翻转二叉树
 
 输入
 4
/   \
2     7
/ \   / \
1   3 6   9
 
 输出
 4
/   \
7     2
/ \   / \
9   6 3   1
   
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
    
    func invertTree1(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        // 前序遍历
        // 交换root结点的左右子结点
        let tmp = root?.left
        root?.left = root?.right
        root?.right = tmp
        // 左右子结点继承翻转它们的子结点
        invertTree(root?.left)
        invertTree(root?.right)
        return root
    }
    
}
