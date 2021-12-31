//
//  _25_K个一组翻转链表.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2021/12/31.
//

import Foundation

/*
 https://leetcode-cn.com/problems/reverse-nodes-in-k-group/
 25. K 个一组翻转链表
 
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
 k 是一个正整数，它的值小于或等于链表的长度。
 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
 
 输入：head = [1,2,3,4,5], k = 2
 输出：[2,1,4,3,5]
 */

class LinkList_25_Solution {
    // 思路：将链表分成n段，每段k个结点，翻转每段链表，再把每段链表链接起来（用前一段翻转后的尾结点指向后一段翻转后的头结点）
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        // 区间 [a, b) 包含 k 个待反转元素
        let a = head
        var b = head
        for _ in 0..<k {
            // 不足k个不需要反转
            if b == nil {
                return head
            }
            b = b?.next
        }
        // 反转前 k 个元素
        let newHead = revserList(a, b)
        // 递归反转后续链表并连接起来
        a?.next = reverseKGroup(b, k)
        return newHead
    }
    
    // 翻转a到b之前的链表
    func revserList(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur = a
        var next = a
        while cur !== b {
            next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }

}
