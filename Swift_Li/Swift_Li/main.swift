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

//let string = "Hello  World! a   bb cc"
//print(Array(string))
//for s in string {
//    print(s)
//}

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


let a1 = String_151_Solution()
let s1 = a1.reverseWords1(string)
print(s1)

var array = [7,1,5,3,6,4]
let dp121 = DP_121_Solution()
dp121.maxProfit_dp(array)

var head1 = ListNode(1)
head1.next = ListNode(2)
head1.next?.next = ListNode(3)
head1.next?.next?.next = ListNode(4)
head1.next?.next?.next?.next = ListNode(6)

//var head2 = ListNode(5)
//head2.next = ListNode(6)
//head2.next?.next = ListNode(4)
//
let linklist = LinkList_876_Solution()
let resL = linklist.middleNode(head1)

let dp509 = DP_509_Solution()
let res509 = dp509.fib_dp(4)


//let array = [4,1,2,1,2]
//let s136 = Solution_136()
//s136.singleNubmer1(array)

var string = "ab cd ef"
let s557 = String_557_Solution()
let res = s557.reverseWords(string)

