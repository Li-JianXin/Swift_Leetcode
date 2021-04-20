//
//  _206_reverseList.swift
//  leetcode
//
//  Created by 李建新 on 2021/4/11.
//

/**
 https://leetcode-cn.com/problems/reverse-linked-list/
 反转链表
 */

/**
 输入 1->2->3->4->5-> NULL
 输出 5->4->3->2->1-> NULL
 */

import Foundation

class LinkList_ReverseList_206 {
    // 递归实现
    func reverseList(_ head: ListNode?) -> ListNode? {
        // 没有结点的链表
        if head == nil {
            return nil
        }
        // 如果传进来的是尾结点，也就是反转后的头结点，直接返回
        // 因为按要求，传进来的结点是头结点，如果头结点的next == nil，说明链表中只有一个结点
        // 这个条件是递归的终止条件
        if head?.next == nil {
            return head
        }
        
        // reverseList方法的作用是，传入一个链表的头结点，返回反转后的头结点
        let newHead = reverseList(head?.next)
        // 反转
        // 1 2 3  1作为头，1的下一个是2，将2的下一个指向了1，也就是反转了（原来指向3）
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
    
    // 非递归实现 迭代
    func reverseList_iteration(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        if head?.next == nil {
            return head
        }
        var p = head
        var newHead: ListNode? = nil
        while p != nil {
            let tmp = p?.next
            p?.next = newHead
            newHead = p
            p = tmp
        }

        return newHead
    }
}
