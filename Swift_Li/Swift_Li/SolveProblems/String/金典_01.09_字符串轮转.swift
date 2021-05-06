//
//  a.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/6.
//

/**
 https://leetcode-cn.com/problems/string-rotation-lcci/
 面试题 01.09. 字符串轮转
 字符串轮转。给定两个字符串s1和s2，请编写代码检查s2是否为s1旋转而成（比如，waterbottle是erbottlewat旋转后的字符串）。
 */

import Foundation

class String_0109_Solution {
    /**
     如果s1和s2长度不同，肯定不是旋转而成
     将s1和s2拼接起来，如果拼接后的字符串中包含s2，则是旋转而成的
     */
    func isFlipedString(_ s1: String, _ s2: String) -> Bool {
        if s1 == s2 {
            return true
        }
        if s1.count != s2.count {
            return false
        }
        let s = s1 + s1
        if s.contains(s2) {
            return true
        }
        return false
    }
}
