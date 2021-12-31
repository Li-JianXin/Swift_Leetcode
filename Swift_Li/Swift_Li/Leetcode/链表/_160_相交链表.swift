//
//  _160_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/3.
//

/**
 https://leetcode-cn.com/problems/intersection-of-two-linked-lists/
 160. 相交链表
 编写一个程序，找到两个单链表相交的起始节点。
 */

import Foundation

class LinkList_160_Solution {
    /**
     将两个链表相互拼接起来，长度就相等了
     一次遍历 O(N)时间复杂度
     */
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        var curA: ListNode? = headA
        var curB: ListNode? = headB
        
        while curA !== curB {
            curA = curA == nil ? headB : curA?.next
            curB = curB == nil ? headA : curB?.next
        }
        return curA
    }
}
