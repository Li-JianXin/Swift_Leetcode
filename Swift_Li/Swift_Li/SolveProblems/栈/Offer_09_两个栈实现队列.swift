//
//  Offer_09_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/16.
//

// https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof/

import Foundation

class CQueue {
    var stack1: [Int]
    var stack2: [Int]

    init() {
        self.stack1 = []
        self.stack2 = []
    }
    
    func appendTail(_ value: Int) {
        stack1.append(value)
    }
    
    func deleteHead() -> Int {
        if stack2.isEmpty {
            // 用数组模拟栈，只能从数组尾部获取元素，符合栈后入先出的特点
            while let head = stack1.popLast() {
                stack2.append(head)
            }
        }
        return stack2.popLast() ?? -1
    }
}

/**
 * Your CQueue object will be instantiated and called as such:
 * let obj = CQueue()
 * obj.appendTail(value)
 * let ret_2: Int = obj.deleteHead()
 */
