//
//  _13_罗马数字.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2021/12/22.
// 


/*
 13. 罗马数字转整数
 https://leetcode-cn.com/problems/roman-to-integer/
 
罗马数字转整数
字符          数值
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
 
 例如， 罗马数字 2 写做 II ，即为两个并列的 1 。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

 通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

 I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
 X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
 C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
 给定一个罗马数字，将其转换成整数。

 示例：
 输入: s = "III"
 输出: 3
 */

import Foundation

class Solution_13 {
    func romanToInt(_ s: String) -> Int {
        // 构建map
        let map: [Character: Int] = ["I": 1,
                                     "V": 5,
                                     "X":10,
                                     "L":50,
                                     "C":100,
                                     "D":500,
                                     "M":1000,
                                     "K":Int.max]
        let sList = Array(s)
        var res = 0
        var preNum = map[sList[0]]!
        for i in 1..<sList.count {
            let value = map[sList[i]]!
            if preNum < value {  // 小的数字在前面，对于总数字来讲，就是减
                res -= preNum
            } else {
                res += preNum
            }
            preNum = value
        }
        res += preNum  // 最后一位做加法
        return res
    }
}
