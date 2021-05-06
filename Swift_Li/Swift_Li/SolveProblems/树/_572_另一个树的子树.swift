//
//  _572_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/6.
//

/**
 https://leetcode-cn.com/problems/subtree-of-another-tree/
 572. 另一个树的子树
 给定两个非空二叉树 s 和 t，检验 s 中是否包含和 t 具有相同结构和节点值的子树。s 的一个子树包括 s 的一个节点和这个节点的所有子孙。s 也可以看做它自身的一棵子树。
 */

import Foundation

class Tree_572_Solution {
    // 普通思路：暴力 遍历树一，判读节点与树二的根节点是否相等，相等的话就继承判断左节点右节点等
    // 思路：利用字符串，将2个树分别序列化成字符串，判断一个字符串是否是另一个字符串的子串
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil || subRoot == nil {
            return false
        }
        let rootStr = postSerialize(root)
        let subRootStr = postSerialize(subRoot)
        return rootStr.contains(subRootStr)
    }
    
    // 利用后序遍历进行序列化
    func postSerialize(_ root: TreeNode?) -> String {
        var str = ""
        postTraversal(root, &str)
        return str
    }
    
    // 后序遍历
    func postTraversal(_ root: TreeNode?, _ str: inout String) {
        if root?.left == nil {
            str.append("#!")
        } else {
            postTraversal(root?.left, &str)
        }
        if root?.right == nil {
            str.append("#!")
        } else {
            postTraversal(root?.right, &str)
        }
        str.append(String(root!.val))
        str.append("!")
    }
}
