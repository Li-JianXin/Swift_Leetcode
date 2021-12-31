//
//  _Offer22_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/4.
//

/**
 https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/
 剑指 Offer 22. 链表中倒数第k个节点
 
 输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。
 例如，一个链表有 6 个节点，从头节点开始，它们的值依次是 1、2、3、4、5、6。这个链表的倒数第 3 个节点是值为 4 的节点。
 */

import Foundation

class Offer22_Solution {
    /**
     思路：双指针，前后指针距离为k，之后2个指针每次+1，当前指针走到最后一个节点时，后指针的位置从后数是k+1。
     再往前走一步时，前指针走向nil，后指针就是倒数第k个节点的位置
     */
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var former = head
        var latter = head
        
        for _ in 0..<k {
            former = former?.next
        }
        if former == nil {
            return head
        }
        while former?.next != nil {
            latter = latter?.next
            former = former?.next
        }
        return latter?.next
     }
}
