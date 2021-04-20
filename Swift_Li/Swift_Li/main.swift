//
//  main.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/12.
//

import Foundation

print("Hello, World!")

// Queue
print("==Queue==========[Begin]=====")
// let queue = LIQueue()
let queue = LIQueue(queuOriginalArray: [8,8,8])
queue.push(1)
queue.push(3)
queue.push(5)
let _ = queue.pop()
queue.inset(33, 2)
print(queue)
print("==Queue==========[ End ]=====")

print("==Stack==========[Begin]=====")
var stack = LIStack<Any>()
print(stack.first)
stack.push(1)
stack.push(2)
stack.push(3, at: 2)
stack.remove(at: 1)
print(stack)
print("==Stack==========[ End ]=====")


print("==LinkList==========[Begin]=====")
let linklist = LILinkList<Int>()
linklist.add(11)
linklist.add(22)
linklist.add(33)
linklist.add(44)
linklist.add(55)
print("linklist 长度\(linklist.length)")

var node = linklist.first
for _ in 0..<linklist.length {
    print(node!.value)
    node = node?.next
}

/*
linklist.remove(0)
print("linklist 长度\(linklist.length)")
 */
print("==LinkList==========[ End ]=====")

let stringOffer58 = String_Offer_58()
let str = stringOffer58.reverseLeftWords("abcdefg", 3)
print(str)

var removeElement = [2, 3, 3, 4, 5, 6, 2]
let array27 = Array_RemoveElement_27()
let array27_count = array27.removeElement(&removeElement, 3)
print(array27_count)


for i in 0..<removeElement.count {
    if removeElement[i] == 0 {
        print(removeElement[i])
    }
}

print("==Array==========[ 283 ]=====")
var array283 = [1,3,0,4,0,6]
let movezers = Array_MoveZeros_283()
movezers.moveZeros(&array283)
print(array283)
print("==Array==========[ 11 ]=====")
var array11 = [1,8,6,2,5,4,8,3,7]
let maxArea = Array_MaxArea_11()
let area = maxArea.maxArea1(array11)
print(area)
