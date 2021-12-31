//
//  _234_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/4.
//

/**
 https://leetcode-cn.com/problems/palindrome-linked-list/
 234. 回文链表
 请判断一个链表是否为回文链表。
 */

/**
 输入: 1->2
 输出: false
 输入: 1->2->2->1
 输出: true
 */

import Foundation

class LinkList_234_Solution {
    /**
     思路一：使用栈，遇到新元素加入，再次遇到相等的出，最后判断是否相等
     */
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head?.next == nil {
            return true
        }
        if head?.next?.val == head?.val && head?.next?.next == nil {
            return true
        }
        
        var cur = head
        var cur1 = head
        var linklistAry: [Int] = []
        while cur != nil {
            linklistAry.append(cur!.val)
            cur = cur?.next
        }
        
        for i in (0..<linklistAry.count).reversed() {
            if linklistAry[i] != cur1?.val {
                return false
            }
            cur1 = cur1?.next
        }
        return true
        
    }
    
    /**
     思路二：找到中间节点，将后半部分的链表反转。再依次对比
     */
    func isPalindrome1(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return true
        }
        if head?.next?.next == nil {
            return head?.val == head?.next?.val
        }
        // 找到中间节点
        let mid = middleNode(head)
        // 翻转右半部分 （中间结点的右边部分）
        var rHead = reverseList(mid.next) // 右部分翻转后的头节点
        var lHead = head
        
        while rHead != nil {
            if lHead?.val != rHead?.val {
                return false
            }
            rHead = rHead?.next
            lHead = lHead?.next
        }
        
        return true
    }
    // 利用快慢指针找到中间结点
    // 慢指针一次走一步 快指针走两步，当快指针走完时，慢指针就正好在中间
    func middleNode(_ head: ListNode?) -> ListNode {
        var slow = head
        var fast = head
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow!
    }
    
    // 反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        if head?.next == nil {
            return head
        }
        var head = head
        var newHead: ListNode? = nil
        while head != nil {
            let tmp = head?.next
            head?.next = newHead
            newHead = head
            head = tmp
        }
        return newHead
    }
}
