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
    
    // 队尾插入
    func appendTail(_ value: Int) {
        stack1.append(value)
    }
    // 头部删除
    func deleteHead() -> Int {
        if stack2.isEmpty {
            // 用数组模拟栈，只能从数组尾部获取元素，符合栈后入先出的特点
            // 栈无法实现队列功能： 栈底元素（对应队首元素）无法直接删除，需要将上方所有元素出栈
            while let head = stack1.popLast() {
                stack2.append(head)
            }
        }
        return stack2.popLast() ?? -1
    }
}
