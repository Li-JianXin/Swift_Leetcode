//
//  _144_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/30.
//

import Foundation

/**
 https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
 二叉树的前序遍历
 给你二叉树的根节点root，返回它节点值的前序遍历
 */

/**
 二叉树的前序遍历：按照访问根节点——左子树——右子树的方式遍历这棵树，而在访问左子树或者右子树的时候，我们按照同样的方式遍历，直到遍历完整棵树。因此整个遍历过程天然具有递归的性质，我们可以直接用递归函数来模拟这一过程。

 定义 preorder(root) 表示当前遍历到 root 节点的答案。按照定义，我们只要首先将 root 节点的值加入答案，然后递归调用 preorder(root.left) 来遍历 root 节点的左子树，最后递归调用 preorder(root.right) 来遍历 root 节点的右子树即可，递归终止的条件为碰到空节点。

 */

class Tree_144_PreorderTraversal {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        guard let root = root else {
            return []
        }
        res.append(root.val)
        print(res)
        res += preorderTraversal(root.left)
        res += preorderTraversal(root.right)
        return res
    }

}
