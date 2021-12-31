//
//  _20_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/6.
//

/**
 https://leetcode-cn.com/problems/valid-parentheses/
 20. 有效的括号
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
 有效字符串需满足：
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 */

import Foundation

class Stack_20_Solution {
    func isValid(_ s: String) -> Bool {
        // 奇数直接返回false
        let length = s.count
        if length & 2 == 1 {
            return false
        }
        var stack: [String] = []
        // 字符map
        let pairs = [")": "(", "]": "[", "}": "{"]
        for char in s {
            // 判断是否是左括号
            if pairs.values.contains(char.description) {
                stack.append(char.description)
            } else if pairs[char.description] != stack.popLast() {
                // 与栈顶元素不同
                return false
            }
        }
        return stack.count == 0
    }
}
