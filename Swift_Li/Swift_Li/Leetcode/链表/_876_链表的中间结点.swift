//
//  _876_链表的中间结点.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2021/12/30.
//

import Foundation

/*
 https://leetcode-cn.com/problems/middle-of-the-linked-list/
 876. 链表的中间结点

 给定一个头结点为 head 的非空单链表，返回链表的中间结点。
 如果有两个中间结点，则返回第二个中间结点。

 输入：[1,2,3,4,5,6]
 输出：此列表中的结点 4 (序列化形式：[4,5,6])
 由于该列表有两个中间结点，值分别为 3 和 4，我们返回第二个结点。
 */

class LinkList_876_Solution {
    // 思路：快慢指针
    // 两个指针 slow 和 fast 分别指向链表头结点 head。
    // 每当慢指针 slow 前进一步，快指针 fast 就前进两步，这样，当 fast 走到链表末尾时，slow 就指向了链表中点
    func middleNode(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        if head?.next == nil {
            return head
        }
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}
