//
//  _141_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/5.
//

/**
 https://leetcode-cn.com/problems/linked-list-cycle/
 141. 环形链表
 给定一个链表，判断链表中是否有环。

 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。

 如果链表中存在环，则返回 true 。 否则，返回 false 。
 
 进阶：

 你能用 O(1)（即，常量）内存解决此问题吗？
 */

import Foundation

class LinkList_141_Solution {
    /**
     思路一：复用快慢指针遍历，当快慢指针相交说明有环，没有则无环
     时间复杂度O(N) 空间复杂度O(1) 符合进阶条件
     */
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        var fast = head?.next
        var slow = head
        
        while fast !== slow {
            if fast == nil || fast?.next == nil {
                return false
            }
            fast = fast?.next?.next
            slow = slow?.next
        }
        return true
    }
    
    /**
     思路二：利用哈希，每遍历一个节点，当储存，当遍历的某个节点在哈希中已经有了，就是环形链表
     */
}
