//
//  _1859_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/25.
//

/**
 https://leetcode-cn.com/problems/sorting-the-sentence/
 1859. 将句子排序
 
 输入：s = "is2 sentence4 This1 a3"
 输出："This is a sentence"
 解释：将 s 中的单词按照初始位置排序，得到 "This1 is2 a3 sentence4" ，然后删除数字。
 */

import Foundation

class Array_1859_Solution {
    func sortSentence(_ s: String) -> String {
        var sAry = s.components(separatedBy: " ")
        for i in (0..<sAry.count).reversed() {
            if sAry[i] == "" {
                sAry.remove(at: i)
            }
        }
        print(sAry)
        
        sAry.sort { (str1, str2) -> Bool in
            let str1EndIdx = str1.endIndex
            let str2EndIdx = str2.endIndex
            let str1LastChar = str1[str1.index(str1EndIdx, offsetBy: -1)]
            let str2LastChar = str2[str2.index(str2EndIdx, offsetBy: -1)]
            let str1LastStr = String(str1LastChar)
            let str2LastStr = String(str2LastChar)
            return Int(str1LastStr) ?? 0 < Int(str2LastStr) ?? 0
        }
        
        for i in 0..<sAry.count {
            var str = sAry[i]
            str.remove(at: str.index(str.endIndex, offsetBy: -1))
            sAry[i] = str
        }
        
        let resString = sAry.joined(separator: " ")
        return resString
    }
}
