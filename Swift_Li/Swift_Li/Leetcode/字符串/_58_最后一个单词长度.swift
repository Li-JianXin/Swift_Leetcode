//
//  _58_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/7.
//

/**
 https://leetcode-cn.com/problems/length-of-last-word/
 58. 最后一个单词的长度
 给你一个字符串 s，由若干单词组成，单词之间用空格隔开。返回字符串中最后一个单词的长度。如果不存在最后一个单词，请返回 0 。
 单词 是指仅由字母组成、不包含任何空格字符的最大子字符串。
 输入：s = "Hello World"
 输出：5
 */

import Foundation

class String_58_Solution {
    /**
     先去掉最后的空格，然后从后向前遍历，遇到空格截止
     */
    func lengthOfLastWord(_ s: String) -> Int {
        var count = 0
        for word in s.reversed() {
            if word != " " {
                count += 1
            } else if count > 0 {
                break
            }
        }
        return count
    }
}
