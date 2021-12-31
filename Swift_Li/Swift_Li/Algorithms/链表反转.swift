//
//  链表反转.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2021/12/31.
//

import Foundation

class LinkList_Solution {
    // https://labuladong.gitee.io/algo/2/17/18/
    // 普通反转一个链表，迭代法
    func revrseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil // pre指向翻转时新的头节点需要指回的结点（翻转部分倒数第二个）
        var cur = head  // cur指向翻转部分的尾结点
        var next = head  // next指向未翻转部分的头节点
        while cur != nil {
            next = cur?.next
            cur?.next = pre  // 逐个结点反转
            // 更新指针位置
            pre = cur
            cur = next
        }
        return pre
    }
    
    // 「反转以 a 为头结点的链表」其实就是「反转 a 到 null 之间的结点」，那么如果让你「反转 a 到 b 之间的结点」，你会不会？
    // 只要更改函数签名，并把上面的代码中 null 改成 b 即可：
    // 翻转a到b之前的链表
    func revserList(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur = a
        var next = a
        while cur !== b {
            next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    
}
