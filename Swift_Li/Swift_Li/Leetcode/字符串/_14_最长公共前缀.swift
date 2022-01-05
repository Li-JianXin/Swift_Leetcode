//
//  _14_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/16.
//

/**
 https://leetcode-cn.com/problems/longest-common-prefix/
 编写一个函数来查找字符串数组中的最长公共前缀。
 如果不存在公共前缀，返回空字符串 ""。
 */

import Foundation

class String_14_Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        // 取一个单词 prefix，和后面单词比较，看 prefix 与每个单词相同的最长前缀是多少！遍历所有单词。
        var prefix = strs[0]
        for i in 1..<strs.count {
            while !strs[i].hasPrefix(prefix) {
                prefix.removeLast()
                if prefix.count == 0 {
                    return ""
                }
            }
        }
        return prefix
    }
}
