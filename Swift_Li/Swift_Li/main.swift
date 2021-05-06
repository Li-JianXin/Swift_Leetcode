//
//  main.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/12.
//

import Foundation

print("Hello, World!")

let string = "Hello  World! a   bb cc"
//for s in string {
//    print(s)
//}

let grid = [[1,3,1],[1,5,1],[4,2,1]]
let offer47 = Offer_47_Solution()
let a = offer47.maxValue(grid)
print(a)

let a1 = String_151_Solution()
let s1 = a1.reverseWords1(string)
print(s1)

//var array = [1,2,3,2,2,2,5,4,2]
//let offer39 = Offer_MajorityElement_39()
//let a = offer39.majorityElement(array)
//print(a)
//
//var head1 = ListNode(1)
//head1.next = ListNode(2)
//head1.next?.next = ListNode(2)
//head1.next?.next?.next = ListNode(1)
//
//var head2 = ListNode(5)
//head2.next = ListNode(6)
//head2.next?.next = ListNode(4)
//
//let linklist = Offer25_Solution()
//let res = linklist.mergeTwoLists(head1, head2)
//print(res)
