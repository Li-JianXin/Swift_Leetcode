//
//  _102_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/18.
//

/**
 https://leetcode-cn.com/problems/binary-tree-level-order-traversal/
 102. 二叉树的层序遍历
 返回二维数组，每一个子数组是当前层数的节点
 */

import Foundation

class Tree_102_Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        // 思路：先找出每层的数量，数量的获取通过遍历上一层节点的所有子节点
        var res: [[Int]] = []
        // 层序遍历
        var queue: [TreeNode] = []
        if root != nil {
            queue.append(root!)
        } else {
            return [[]]
        }
        
        while !queue.isEmpty {
            // 在每一次遍历前获取队列中结点数量，也就是这一层的结点数量
            let nodeCount = queue.count
            var level: [Int] = []
            for _ in 0..<nodeCount {
                // 如果正在第二层遍历时，queue中pop的node就是根node，node的左右就是第2层的数量
                let node = queue.removeFirst() // 正常使用removeFirst需要判断数组是否为空，这里循环次数就是queue的count 所有不用
                level.append(node.val)

                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.append(level)
        }
        return res
    }
    
    
    
}
