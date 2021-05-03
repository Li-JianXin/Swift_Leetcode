//
//  main.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/12.
//

import Foundation

print("Hello, World!")

var array = [1,2,3,2,2,2,5,4,2]
let offer39 = Offer_MajorityElement_39()
let a = offer39.majorityElement(array)
print(a)

var head1 = ListNode(2)
head1.next = ListNode(4)
head1.next?.next = ListNode(3)

var head2 = ListNode(5)
head2.next = ListNode(6)
head2.next?.next = ListNode(4)

let linklist2 = LinkList_2_Solution()
let node = linklist2.addTwoNumbers(head1, head2)
print(node?.val,node?.next?.val,node?.next?.next?.val)
