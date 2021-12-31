//
//  _118_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/15.
//

import Foundation

// https://leetcode-cn.com/problems/pascals-triangle/

class Array_118_Solution {
    func generate(_ numRows: Int) -> [[Int]] {
           var triangle: [[Int]] = Array(repeating: [],count: numRows)
           for i in 0..<numRows {
               // dp 先填充1
               var list: [Int] = Array(repeating: 1, count: i+1)
               for j in 0...i {
                   if j != 0 && j != i {
                       list[j] = triangle[i-1][j-1] + triangle[i-1][j]
                   }
                   triangle[i] = list
               }

           }
           return triangle
       }
}
