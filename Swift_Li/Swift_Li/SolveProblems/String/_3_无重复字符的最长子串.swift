//
//  _3_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/6.
//

/**
 https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
 3. 无重复字符的最长子串
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 */

import Foundation

class String_3_Solution {
    /**
     暴力法O(n^2)，可以使用哈希降低到O(n)。
     使用双指针，记录双指针之间的最长不重复长度，遇到重复的字符时记录并移动左指针
     滑动窗口思路，两个指针之间就是一个窗口
     */
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        let sAry = Array(s)
        var map: [Character: Int] = [:]  // 记录某个字符为起点的最长不重复子串长度
        var left = 0
        var maxLength = 0
        for i in 0..<sAry.count {
            if map.keys.contains(sAry[i]) {
                left = max(left, map[sAry[i]]!+1)
            }
            map[sAry[i]] = i
            maxLength = max(maxLength, i-left+1)
        }
        return maxLength
    }
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        let sAry = Array(s)
        // 用来保存每个字符上一次出现的位置
        var map: [Character: Int] = [:]
        // 以i-1位置字符结尾的最长不重复字符串的开始索引  最左索引
        var li = 0
        var maxValue = 1
        for i in 0..<sAry.count {
            // i位置字符上一次出现的位置
            if let pi = map[sAry[i]] {
                if li <= pi {
                    li = pi + 1 // 移动左指针
                }
            }
            // 存储这个字符出现的位置
            map[sAry[i]] = i
            // 求最长不重复子串的长度
            maxValue = max(maxValue, i - li + 1)
        }
        return maxValue
    }
}
