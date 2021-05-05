//
//  _25_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/5.
//

import Foundation

/**
 https://leetcode-cn.com/problems/he-bing-liang-ge-pai-xu-de-lian-biao-lcof/
 剑指 Offer 25. 合并两个排序的链表
 输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 */

class Offer25_Solution {
    /**
     思路一：创建一条新链表，依次对比两个链表
     */
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        // 建一个虚拟头节点
        let dummy = ListNode(0)
        var cur = dummy
        
        while l1 != nil || l2 != nil {
            if l1 == nil {
                cur.next = l2
                break
            }
            if l2 == nil {
                cur.next = l1
                break
            }
            if l1!.val > l2!.val {
                cur.next = l2
                l2 = l2?.next
            } else {
                cur.next = l1
                l1 = l1?.next
            }
            cur = cur.next!
        }
        return dummy.next
    }
}
