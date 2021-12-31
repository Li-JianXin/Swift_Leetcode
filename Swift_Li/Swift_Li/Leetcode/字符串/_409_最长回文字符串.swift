//
//  _409_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/6/7.
//

/**
 409. 最长回文串
 https://leetcode-cn.com/problems/longest-palindrome/
 
 给定一个包含大写字母和小写字母的字符串，找到通过这些字母构造成的最长的回文串。
 在构造过程中，请注意区分大小写。比如 "Aa" 不能当做一个回文字符串。
 注意:
 假设字符串的长度不会超过 1010。
 */

import Foundation

class Solution_409 {
    // 每个字母出现的次数都是偶数
    // 有一个字母出现次数是奇数，其它字母出现次数都是偶数
    func longestPalindrome(_ s: String) -> Int {
        guard s.isEmpty == false else {
            return 0
        }
        // key是字母，value是字母出现的次数
        var record = [Character: Int]()
        for c in s {
            record[c, default: 0] += 1
        }
        var count = 0
        var odd = 0  // 出现过的奇数 每出现一次就+1
        for value in record.values {
            // 如果value是偶数，加上value
            if value % 2 == 0 {
                count += value
            } else {
                // 如果value是奇数,加上value-1 并标记出现过的奇数
                count += (value - 1)
                odd = 1
            }
        }
        return count + odd
    }
}
