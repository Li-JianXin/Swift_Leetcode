//
//  _Offer18_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/30.
//

import Foundation

/**
 https://leetcode-cn.com/problems/shan-chu-lian-biao-de-jie-dian-lcof/
 剑指 Offer 18. 删除链表的节点
 
 给定单向链表的头指针和一个要删除的节点的值，定义一个函数删除该节点。
 返回删除后的链表的头节点。
 */

/**
 输入: head = [4,5,1,9], val = 5
 输出: [4,1,9]
 解释: 给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
 */

class Offer18_DeleteNode {
    /**
     双指针
     */
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head?.val == val {
            return head?.next
        }
        var preNode = head
        var curNode = head?.next
        while curNode!.next != nil && curNode?.val != val {
            preNode = curNode
            curNode = curNode?.next
        }
        if preNode != nil {
            preNode?.next = curNode?.next
        }
        return head
    }
}
