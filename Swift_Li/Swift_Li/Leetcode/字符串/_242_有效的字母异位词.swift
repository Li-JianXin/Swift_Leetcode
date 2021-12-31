//
//  _242.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/6.
//

/**
 https://leetcode-cn.com/problems/valid-anagram/
 242. 有效的字母异位词
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
 输入: s = "anagram", t = "nagaram"
 输出: true
 输入: s = "rat", t = "car"
 输出: false
 */

import Foundation
/**
 思路一：排序后，比较是否相同
 思路二：哈希表
 */

class String_242_Solution {
    /**
     分别统计两个字符串中不同字符数量，可以利用哈希
     */
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        var map: [Character: Int] = [:]
        for c in s {
            if map.keys.contains(c) {
                map[c] = map[c]! + 1
            } else {
                map[c] = 1
            }
        }
        for c in t {
            if map.keys.contains(c) {
                map[c] = map[c]! - 1
                if map[c] == 0 {
                    map.removeValue(forKey: c)
                }
            } else {
                return false
            }
        }
        for (_,value) in map {
            if value != 0 {
                return false
            }
        }
        return true
    }
}
