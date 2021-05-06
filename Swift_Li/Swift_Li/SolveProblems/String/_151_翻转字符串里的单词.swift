//
//  _151_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/6.
//

/**
 https://leetcode-cn.com/problems/reverse-words-in-a-string/
 151. 翻转字符串里的单词
 给定一个字符串，逐个翻转字符串中的每个单词。

 说明：
 无空格字符构成一个 单词 。
 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
 */

import Foundation

class String_151_Solution {
    // 需要翻转，还需要去掉多余空格
    // 思路：2次翻转，先把单词顺序翻转并去掉多余空格，然后把每个单词翻遍
    func reverseWords(_ s: String) -> String {
        return s.split { $0.isWhitespace }.reversed().joined(separator: " ")
    }
    func reverseWords1(_ s: String) -> String {
        let sAry = s.components(separatedBy: " ")
        var res: [String] = []
        for i in (0..<sAry.count).reversed() {
            if !sAry[i].isEmpty {
                res.append(sAry[i])
            }
        }
        return res.joined(separator: " ")
    }
}
