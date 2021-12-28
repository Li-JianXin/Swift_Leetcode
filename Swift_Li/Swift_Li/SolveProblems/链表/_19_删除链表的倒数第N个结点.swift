//
//  _19_删除链表的倒数第N个结点.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2021/12/28.
//

import Foundation

/*
 https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
 19. 删除链表的倒数第 N 个结点
 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
 
 输入：head = [1,2,3,4,5], n = 2
 输出：[1,2,3,5]
 
 进阶：你能尝试使用一趟扫描实现吗？
 */

class LinkList_19_Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        if n == 0 {
            return head
        }
        // 思路：双指针法找到需要被删除的结点的前一个结点
        let dummyHead = ListNode(0, head)  // 虚拟节点
        var fast: ListNode? = dummyHead // 快的结点
        var slow: ListNode? = dummyHead
        
        for _ in 0..<n {
            fast = fast?.next
        }
        if fast == nil {
            return nil  // n超出了链表长度
        }
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        // 循环结束，latter是倒数n个结点的前一个节点
        slow?.next = slow?.next?.next
        return dummyHead.next
     }
}
