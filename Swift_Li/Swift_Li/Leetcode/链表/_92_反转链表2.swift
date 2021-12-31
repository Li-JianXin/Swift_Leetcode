//
//  _92_反转链表2.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2021/12/31.
//

import Foundation

/*
 https://leetcode-cn.com/problems/reverse-linked-list-ii/
 92. 反转链表 II
 
 给你单链表的头指针 head 和两个整数 left 和 right ，其中 left <= right 。请你反转从位置 left 到位置 right 的链表节点，返回 反转后的链表 。
 */

class LinkList_92_Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == 1 {
            return revserN(head, right);
        }
        // 前进到反转的起点触发 base case
        head?.next = reverseBetween(head?.next, left - 1, right - 1)
        return head
    }
    
    var successor: ListNode?  // 未翻转部分的头结点
    // 反转以Head为起点的n个节点，返回新的头结点
    func revserN(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n == 1 {
            successor = head?.next
            return head
        }
        // 以 head.next 为起点，需要反转前 n - 1 个节点
        let last = revserN(head?.next, n - 1)
        head?.next?.next = head
        head?.next = successor  // 让反转之后的 head 节点和后面的节点连起来
        return last
    }
}
