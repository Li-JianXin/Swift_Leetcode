//
//  _2_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/3.
//

/**
 https://leetcode-cn.com/problems/add-two-numbers/
 2.两数相加
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
 请你将两个数相加，并以相同形式返回一个表示和的链表。
 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 */
/**
 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 */
/**
 123
 234
 357
 */

import Foundation

class LinkList_2_Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            if l1 == nil {
                return l2
            }
            if l2 == nil {
                return l1
            }
            var l1 = l1
            var l2 = l2
            // 虚拟头节点
            let dummyHead = ListNode(0)
            var last = dummyHead
            
            var carry = 0 // 进位值
            while l1 != nil || l2 != nil {
                let l1val = l1?.val ?? 0
                let l2val = l2?.val ?? 0
                let sum = l1val + l2val + carry
                carry = sum / 10
                let nextNodel =  ListNode(sum % 10)
                last.next = nextNodel
                last = last.next!
                
                l1 = l1?.next
                l2 = l2?.next
            }
            
            // 判断是否有进位
            if carry > 0 {
                last.next = ListNode(carry)
            }
            return dummyHead.next
    }
}
