//
//  _100_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/12.
//

/**
 https://leetcode-cn.com/problems/same-tree/
 100. 相同的树
 给你两棵二叉树的根节点 p 和 q ，编写一个函数来检验这两棵树是否相同。
 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
 */

import Foundation

class Tree_100_Solution {
    // 深度优先遍历 DFS: 先序遍历、后序遍历、中序遍历
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        if p == nil || q == nil {
            return false
        }
        if p?.val != q?.val {
            return false
        }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, p?.right)
    }
}
