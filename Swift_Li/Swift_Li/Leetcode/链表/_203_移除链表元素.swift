//
//  _203_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/30.
//

/**
 https://leetcode-cn.com/problems/remove-linked-list-elements/
 203. 移除链表元素
 给你一个链表的头节点 head 和一个整数 val ，请你删除链表中 所有 满足 Node.val == val 的节点，并返回 新的头节点 。
 */

import Foundation

class LinkList_203 {
    // 通过哨兵节点 虚拟头节点
    // 主要目的是使链表标准化，如使链表永不为空、永不无头、简化插入和删除。
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        if head?.next == nil && head?.val == val {
            return nil
        }
        // 新链表的头节点 虚拟头节点
        let newHead = ListNode(0)
        // 新链表的尾节点
        var newTail = newHead
        
        var curNodel = head
        
        while curNodel != nil {
            if curNodel?.val != val {
                newTail.next = curNodel
                newTail = curNodel!
            }
            curNodel = curNodel?.next
        }
        newTail.next = nil
        return newHead.next
    }
}
