//
//  _5_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/16.
//
// https://leetcode-cn.com/problems/longest-palindromic-substring/
// 给你一个字符串 s，找到 s 中最长的回文子串。


import Foundation

class String_5_Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count == 0 {
            return s
        }
        let sList = Array(s)
        var dp: [[Bool]] = Array(repeating:Array(repeating: false ,count: sList.count) ,count:sList.count)

        var maxLength = 1
        var beginIndex = 0

        for i in (0..<sList.count).reversed() {
            for j in i..<sList.count {
                // 字符长度
                let length = j - i + 1
                if sList[i] == sList[j] && (length <= 2 || dp[i+1][j-1]) {
                    dp[i][j] = true
                    if dp[i][j] && length > maxLength {
                        maxLength = length
                        beginIndex = i
                    }
                }
            }
        }
        return String(sList[beginIndex..<beginIndex+maxLength])
    }
}
