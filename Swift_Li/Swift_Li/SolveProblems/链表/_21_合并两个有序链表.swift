//
//  _21_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/8.
//

/**
 https://leetcode-cn.com/problems/merge-two-sorted-lists/
 21. 合并两个有序链表
 */

import Foundation

class LinkList_21_Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var cur = dummy
        var l1Cur = l1
        var l2Cur = l2
        while l1Cur != nil && l2Cur != nil {
            if l1Cur!.val <= l2Cur!.val {
                cur.next = l1Cur
                l1Cur = l1Cur?.next
            } else {
                cur.next = l2Cur
                l2Cur = l2Cur?.next
            }
            cur = cur.next!
        }
        // while结束后，有一个链表为空，另一个不为空
        cur.next = l1Cur == nil ? l2Cur : l1Cur
        return dummy.next
    }
}
