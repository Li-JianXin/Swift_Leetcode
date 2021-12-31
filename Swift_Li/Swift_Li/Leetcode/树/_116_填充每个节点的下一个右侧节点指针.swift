//
//  _116_填充每个节点的下一个右侧节点指针.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2021/12/31.
//

import Foundation

/*
 https://leetcode-cn.com/problems/populating-next-right-pointers-in-each-node/
 116. 填充每个节点的下一个右侧节点指针
 
 给定一个 完美二叉树 ，其所有叶子节点都在同一层，每个父节点都有两个子节点。二叉树定义如下：
 填充它的每个 next 指针，让这个指针指向其下一个右侧节点。如果找不到下一个右侧节点，则将 next 指针设置为 NULL。
 初始状态下，所有 next 指针都被设置为 NULL。
 */

public class NextTreeNode {
    public var val: Int
    public var left: NextTreeNode?
    public var right: NextTreeNode?
    public var next: NextTreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

class Tree_116_Solution {
    // 思路和翻转二叉树类似
    func connect(_ root: NextTreeNode?) -> NextTreeNode? {
        // 根结点
        if root == nil {
            return nil
        }
        connectTwoNode(root?.left, root?.right)
        return root
    }
    
    // 辅助函数
    func connectTwoNode(_ node1: NextTreeNode?, _ node2: NextTreeNode?) {
        if node1 == nil || node2 == nil {
            return
        }
        /**** 前序遍历位置 ****/
        // 将传入的两个节点连接
        node1?.next = node2
        // 连接相同父结点的两个子结点
        connectTwoNode(node1?.left, node1?.right)
        connectTwoNode(node2?.left, node2?.right)
        // 连接跨越父节点的两个子节点
        connectTwoNode(node1?.right, node2?.left)
    }
}
