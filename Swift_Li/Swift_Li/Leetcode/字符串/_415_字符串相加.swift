//
//  _414_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/15.
//

// https://leetcode-cn.com/problems/add-strings/

import Foundation

class String_415_Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        let num1_sList = Array(num1)
        let num2_sList = Array(num2)
        var i = num1_sList.count - 1
        var j = num2_sList.count - 1
        var res: String = ""

        var carry = 0
        // 字符 0 的 ascii 值
        let asciiValueOfZeroChar = String.Element("0").asciiValue!  // String.Element 返回的是字符
        
        while i >= 0 || j >= 0 {
            let num1s = i >= 0 ? num1_sList[i].asciiValue! - asciiValueOfZeroChar : 0
            let num2s = j >= 0 ? num2_sList[j].asciiValue! - asciiValueOfZeroChar : 0

            var temRes = Int(num1s) + Int(num2s) + carry

            if temRes >= 10 {
                carry = 1
                temRes = temRes % 10
            } else {
                carry = 0
            }

            i -= 1
            j -= 1

            res += String(temRes)
        }
        // 最后一位还有进位
        if carry == 1 {
            res += String(carry)
        }
        return String(res.reversed())
    }
}


