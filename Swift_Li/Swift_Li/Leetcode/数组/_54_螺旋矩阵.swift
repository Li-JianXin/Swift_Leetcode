//
//  _54_螺旋矩阵.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2022/1/12.
//

import Foundation

/*
 https://leetcode-cn.com/problems/spiral-matrix/
 54. 螺旋矩阵
 给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。
 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 */

class Solution_54 {
    /*
     1.设定上下左右边界
     2.其次向右移动到最右，此时第一行因为已经使用过了，可以将其从图中删去，体现在代码中就是重新定义上边界
     3.判断若重新定义后，上下边界交错，表明螺旋矩阵遍历结束，跳出循环，返回答案
     4.若上下边界不交错，则遍历还未结束，接着向下向左向上移动，操作过程与第一，二步同理
     5.不断循环以上步骤，直到某两条边界交错，跳出循环，返回答案
     */
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        if matrix.count == 0 { // matrix数组为空，直接返回空数组
            return res
        }
        // 定义上下左右边界
        var top = 0
        var bottom = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1
        
        while true {
            // 向右移动
            for i in left...right {
                res.append(matrix[top][i])
            }
            top += 1  // 重新设定上边界
            if top > bottom { // 若上边界大于下边界，则遍历完成
                break;
            }
            // 向下移动
            for i in top...bottom {
                res.append(matrix[i][right])
            }
            right -= 1 // 重新设置右边界
            if left > right {  // 若左边界超过右边界，则遍历完成
                break;
            }
            // 向左移动
            for i in (left...right).reversed() {
                res.append(matrix[bottom][i])
            }
            bottom -= 1
            if top > bottom { // 若上边界大于下边界，则遍历完成
                break;
            }
            // 向上移动 （向上移动一次，代表最左边的一侧从底到顶遍历完成，所以左边界left+1）
            for i in (top...bottom).reversed() {
                res.append(matrix[i][left])
            }
            left += 1
            if left > right {  // 若左边界超过右边界，则遍历完成
                break;
            }
        }
        return res
    }
}
