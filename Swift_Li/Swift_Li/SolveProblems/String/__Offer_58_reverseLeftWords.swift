//
//  __Offer_58_reverseLeftWords.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/14.
//

// https://leetcode-cn.com/problems/zuo-xuan-zhuan-zi-fu-chuan-lcof/
/**
 左旋转字符串
 字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。
 */
import Foundation


class String_Offer_58 {
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        // 字符串转字符数组 [Character]
        var sArray = Array(s)
        var newStirng = String()
        for i in n..<sArray.count {
            // 将字符转字符串
            newStirng += String(sArray[i])
        }
        for i in 0..<n {
            newStirng += String(sArray[i])
        }
        return newStirng
        /*
        字符串切片
        subffix 从结尾截取 prefix从头截取  返回 Substring
        */
        // return String(s.suffix(s.count-n) + s.prefix(n))
        
        /*
         func dropFirst(_ k: Int = 1) -> Substring
         从头开始，除了前k个的字符串
         如k=2，就是除了前2个的字符串 k默认1
         
         func dropLast(_ k: Int) -> Substring
         从尾开始，除了后k个的字符串
         无默认值
         */
        // return String(s.dropFirst(n) + s.prefix(n))
        
        // 遍历
        let sArry = Array(s)
        var newString = String()
        newString += sArry[n..<sArry.count]
        newString += sArry[0..<n]
        
        // 数组遍历的写法
        for i in 0..<sArry.count {
            print(sArry[i])
        }
        for element in sArry {
            print(element)
        }
        // 元组遍历
        for (index, element) in sArry.enumerated() {
            print("index \(index) , element: + \(element)")
        }
        for s in sArry.enumerated() {
            print("元组：\(s)")
        }
        // 倒序遍历
        for _ in sArray.reversed(){
            
        }
        
    
        return newString
    }
}
