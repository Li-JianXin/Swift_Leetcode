//
//  _155_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/6.
//

/**
 https://leetcode-cn.com/problems/min-stack/
 155. 最小栈
 设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。

 push(x) —— 将元素 x 推入栈中。
 pop() —— 删除栈顶的元素。
 top() —— 获取栈顶元素。
 getMin() —— 检索栈中的最小元素。
 */

import Foundation

// 直接解法
class MinStack {
    var stack: [Int] = []
    var minNum: Int?
    
    init() {
        stack.reserveCapacity(500)
    }
    
    func push(_ val: Int) {
        stack.append(val)
        minNum  = min(minNum ?? .max , val)
    }
    
    func pop() {
        let last = stack.popLast()
        if last == minNum {
            minNum = stack.min()
        }
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return minNum!
    }
}

// 辅助栈解法
class MinStack1 {
    /**
     使用额外的空间储存当前入栈元素中的最小元素
     */
    var stack: [(Int, Int)] = []
    
    init() {
        stack.reserveCapacity(500)
    }
    
    func push(_ val: Int) {
        if let last = stack.last?.1 {
            stack.append((val, min(last, val)))
        } else {
            stack.append((val, val))
        }
    }
    
    func pop() {
        stack.popLast()
    }
    
    func top() -> Int {
        return stack.last!.0
    }
    
    func getMin() -> Int {
        return stack.last!.1
    }
}
