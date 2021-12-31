//
//  _Offer24_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/30.
//

import Foundation

/**
 https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof/
 剑指Offer 24. 反转链表
 定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。
 */
/**
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 */

class Offer24_ReverseList {
    func reverseList(_ head: ListNode?) -> ListNode? {
        // 双指针法 迭代
        // 定义两个指针 pre和cur; pre在前，cur在后
        // 每次让pre的next指向cur，实现一次局部反转
        // 局部反转完成后，pre和cur同时往前移动一个位置
        // 循环上述过程，直到pre到达链表尾部
        var cur: ListNode?
        var pre = head
        
        while pre != nil {
            let pNext = pre?.next
            pre?.next = cur
            cur = pre
            pre = pNext
        }
        return cur
    }
    
    func reverseList1(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        // 递归
        // 使用递归函数，一直递归到链表的最后一个结点，该结点就是反转后的头结点，记作 ret
        // 此后，每次函数在返回的过程中，让当前结点的下一个结点的 next 指针指向当前节点
        // 同时让当前结点的next 指针指向NULL ，从而实现从链表尾部开始的局部反转
        // 当递归函数全部出栈后，链表反转完成。
        
        // 如果传进来的是尾结点，也就是反转后的头结点，直接返回
        // 因为按要求，传进来的结点是头结点，如果头结点的next == nil，说明链表中只有一个结点
        // 这个条件是递归的终止条件
        if head?.next == nil {
            return head
        }
        // reverseList方法的作用是，传入一个链表的头结点，返回反转后的头结点
        let newHead = reverseList1(head?.next)
        // 反转
        // 1 2 3  1作为头，1的下一个是2，将2的下一个指向了1，也就是反转了（原来指向3）        head?.next?.next = head
        head?.next?.next = head
        head?.next = nil // 进入下次递归条件返回使用
        return newHead
        // 1->2->3->4->5->nil
        // 理解：当递归到最后返回时 第一个newHead就是原来链表的尾结点5，此时的head是是4，4.next.next 就是4的下一个结点5的下一个结点指向4，完成反转
    }
    
}
