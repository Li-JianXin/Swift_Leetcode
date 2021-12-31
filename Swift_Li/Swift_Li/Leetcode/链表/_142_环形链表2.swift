//
//  _142_环形链表2.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2021/12/30.
//

import Foundation

/*
 https://leetcode-cn.com/problems/linked-list-cycle-ii/
 142. 环形链表 II
 
 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。

 不允许修改 链表。
 */

class LinkList_142_Solution {
    /*
     思路：此题是环形链表进阶，在环形链表中找到起点
     环形链表中，快慢指针相遇时，慢指针走了k步，快指针走了2k步，多的这k步就是环形链表一形的长度。
     假设相遇点是m，那再走k-m就是环的起点
     */
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {  // 确认是否是环形链表
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                break
            }
        }
        // 循环退出时如果fast为nil或者next为nil，说明不是环形链表
        if fast == nil || fast?.next == nil {
            return nil
        }
        // 慢指针重新指向头结点
        slow = head
        // 快慢指针同时前进，相交点就是环起点
        // 理解：相遇点距离环起点假设为m，那么相遇点距离头结点距离为k，那环起点距离头结点距离为k-m
        // 此时，相遇点再走k-m的距离也能到达环的起点。所以慢指针从头结点出发，快指针从相遇点出发，他们都经过k-m的距离后会相遇，相遇点就是环的起点
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }
        return slow
    }
}
