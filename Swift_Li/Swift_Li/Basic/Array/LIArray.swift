//
//  LIArray.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/20.
//

import Foundation
/*
class LIArray<E> {
    var count = 0 // 长度
    var first: E?  // 头
    var last: E?  // 尾
    func add(_ element: E) {
    }
    func remove(_ index: Int) {
    }
    func get(_ index: Int) -> E {
    }
    func removeAll() {
    }
    func contains(_ element: E) -> Bool {
    }
}
 */

// MARK: - 遍历
class LIArray_1 {
    // 数组遍历的写法
    func through() {
        let sArray = [Int]()
        for i in 0..<sArray.count {
            print(sArray[i])
        }
        for element in sArray {
            print(element)
        }
        // 元组遍历
        for (index, element) in sArray.enumerated() {
            print("index \(index) , element: + \(element)")
        }
        for s in sArray.enumerated() {
            print("元组：\(s)")
        }
        // 倒序遍历
        for _ in sArray.reversed(){
            
        }
        
        let s = "abcdefg"
        let sArry = Array(s)  // 字符串转字符数组 char
        var newString = String()
        newString += sArry[0..<sArry.count]
    
    }
   
}



