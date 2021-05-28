//
//  main.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/12.
//

import Foundation


//let sortString = "wan2   ba1 a0"
//let solution = Array_1859_Solution()
//let str00 = solution.sortSentence(sortString)
//print(str00)

let solution = Solution253()
let count = solution.minMeetingRooms([[9,10],[4,9],[4,17]])
print(count)

print("Hello, World!")

let string = "Hello  World! a   bb cc"
print(Array(string))
for s in string {
    print(s)
}

//var prefix = string[0]

var map: [Int: Int] = [:]
map[1] = 11
// 判断字典
if let abc = map[1] {
    print(abc)
} else {
    print("没有")
}

let d:String = "0"
let c = String.Element("b")


//var map: [Int: Int] = [:]
//map[0] = 0

//var res: [Int] =
//res[0] = 1

//let solution = String_5_Solution()
//let res = solution.longestPalindrome("ababa")
//print(res)

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
