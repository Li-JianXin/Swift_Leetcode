//
//  _136_只出现一次的数字.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2021/12/24.
//

/*
 https://leetcode-cn.com/problems/single-number/
 136. 只出现一次的数字
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

 示例 1:
 输入: [2,2,1]
 输出: 1
 */

import Foundation

class Solution_136 {
    func singleNubmer(_ nums: [Int]) -> Int {
        // 使用Map
        var map:[Int: Int] = [:]
        for i in 0..<nums.count {
            let key = nums[i]
            if map.keys.contains(key) {
                let count = map[key]! + 1
                map[key] = count
            } else {
                map[key] = 1
            }
        }
        for (key, value) in map {
            if value == 1 {
                return key
            }
        }
        return 0
    }
    
    // 不使用额外空间
    // 线性时间复杂度，所以不能双重遍历 O(n^2)
    // 解法 位运算 异或
    // 任何数和 00 做异或运算，结果仍然是原来的数，即 a \oplus 0=aa⊕0=a。
    // 任何数和其自身做异或运算，结果是 00，即 a \oplus a=0a⊕a=0。
    // 异或运算满足交换律和结合律，即 a \oplus b \oplus a=b \oplus a \oplus a=b \oplus (a \oplus a)=b \oplus0=ba⊕b⊕a=b⊕a⊕a=b⊕(a⊕a)=b⊕0=b。
    
    // 如果a、b两个值不相同，则异或结果为1。如果a、b两个值相同，异或结果为0。 异或的数学符号为“⊕”，计算机符号为“xor”。

    func singleNubmer1(_ nums: [Int]) -> Int {
        var single = 0
        for num in nums {
            single ^= num
        }
        return single
    }
}
