//
//  _237_deleteNode.swift
//  leetcode
//
//  Created by 李建新 on 2021/4/11.
//

/**
 * 删除链表中的节点
 * https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
 * 请编写一个函数，使其可以删除某个链表中给定的（非末尾）节点。传入函数的唯一参数为 要被删除的节点
 */

import Foundation

/**
 从链表里删除一个节点 node 的最常见方法是修改之前节点的 next 指针，使其指向之后的节点。

 我们无法访问我们想要删除的节点 之前 的节点，我们始终不能修改该节点的 next 指针。相反，我们必须将想要删除的节点的值替换为它后面节点中的值，然后删除它之后的节点。
 */

class LinkList_237_DeleteNode {
    func deleNode (_ node: ListNode?) {
        // 找上个节点 上个节点.next = node.next
        // 因为找不到，将当前的节点替换成下一个节点，依次替换到最后
        node?.val = node!.next!.val
        node?.next = node?.next?.next
    }
}

