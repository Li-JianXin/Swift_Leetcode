//
//  LITree.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/30.
//

import Foundation

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    // 空节点
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class TreeSolution {
    func traverse(_ root: TreeNode?) {
        // root 需要做什么？在这做 (递归终止条件)
        // 其他的不用 root 操心，抛给框架
        traverse(root?.left)
        traverse(root?.right)
    }
    
    // 示例
    // 1.二叉树所有节点中的值+1
    func plusOne(_ root: TreeNode?) {
        if root == nil {
            return;
        }
        root?.val += 1
        plusOne(root?.left)
        plusOne(root?.right)
    }
    
    // 2.如何判断两棵二叉树是否完全相同？
    func isSameTree (_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1 == nil && root2 == nil {  // 都为空，一样
            return true
        }
        if root1 == nil || root2 == nil {  // 一个为空，一个不为空，不一样 （都为空的情况已经被第一次判断过滤了）
            return false
        }
        if root1?.val != root2?.val {  // 两个都不为空，但值不同，不一样
            return false
        }
        // root1和root2该比较的都比较完了
        return isSameTree(root1?.left, root2?.left) && isSameTree(root1?.right, root2?.right)
    }
}
