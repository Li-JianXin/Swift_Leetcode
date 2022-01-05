//
//  _43_字符串相乘.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2022/1/4.
//

import Foundation

/*
 https://leetcode-cn.com/problems/multiply-strings/
 43. 字符串相乘
 
 给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。
 输入: num1 = "2", num2 = "3"
 输出: "6"
 
 不能使用任何标准库的大数类型（比如 BigInteger）或直接将输入转换为整数来处理。
 
 问题：如果相乘的两个因数非常大，语言提供的数据类型可能就会溢出
 */

class String_43_Solution {
    // 运算数以字符串的形式输入，然后模仿我们小学学习的乘法算术过程计算出结果，并且也用字符串表示
    func multiply(_ num1: String, _ num2: String) -> String {
        /*
        var length1 = num1.count
        var length2 = num2.count
        var res = [Int](repeating: 0, count: length1 + length2)
        // 结果最多为m+n位
        // 从个位数开始逐位相乘
        for i in (0..<length1).reversed() {
            for j in (0..<length2).reversed() {
                let mul = (num1[i] - '0') * (num2[j] - '0')
                // 乘积在 res 对应的索引位置
                let p1 = i + j
                let p2 = i + j + 1
                // 叠加到 res 上
                let sum = mul + res[p2]
                res[p2] = sum % 10
                res[p1] = sum / 10
            }
        }
        // 结果前缀可能存的0 （未使用的位）
        var i = 0
        while i < res.count && res[i] == 0 {
            i+=1
        }
        // 将计算结果转为字符串
        var str:String
        for i in i..<res.count {
            str += ('0' + res[i])
        }
        return str.count == 0 ? '0' + str
         */
        return ""
    }
}
