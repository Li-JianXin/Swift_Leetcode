//
//  _557_反转字符串中的单词3.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2021/12/28.
//

import Foundation

/*
 https://leetcode-cn.com/problems/reverse-words-in-a-string-iii/
 
 557. 反转字符串中的单词 III
 给定一个字符串，你需要反转字符串中每个单词的字符顺序，同时仍保留空格和单词的初始顺序。
 
 输入："Let's take LeetCode contest"
 输出："s'teL ekat edoCteeL tsetnoc"
 
 在字符串中，每个单词由单个空格分隔，并且字符串中不会有任何额外的空格。
 */

class String_557_Solution {
    func reverseWords(_ s: String) -> String {
        // 常规思路 string以空格隔断转数组，遍历数组，将数组中每个字符串元素反转，拼接成新的字符串返回
        // 时间复杂度0(N) 空间复杂度0(N)
        // "ab cd ef"
        let reverse = String(s.reversed())  // 整个字符串反转 "fe dc ba"
        let array = reverse.split(separator: " ")  // 通过空格分隔成字符串数组 ["fe", "dc", 'ba']
        let resArray = array.reversed() // 反转数组 ["ba", "dc", "fe"]
        let res = resArray.joined(separator: " ")  // 数组转为字符串 "ba dc fe"
        return res
    }
    
    // 第二种思路 空间复杂度O(1) 时间复杂度O(N) 原地解法 前提是字符串可变可操作
    // 思路是找到第一个字符串后，将其第一位与未位交换，第二位与倒数第二位交换，一直循环下去
        
}
