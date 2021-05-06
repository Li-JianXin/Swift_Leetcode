//
//  _47_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/6.
//

/**
 https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/
 剑指 Offer 47. 礼物的最大价值
 在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？
 */

import Foundation

class Offer_47_Solution {
    /**
     假设dp[row][col]是直到[row][col]的最大价值
     如何直到这个位置有2种方式，分别是从[row][col-1]或者[row-1][col] (因为只能向左移动或者向下移动)
     */
    func maxValue(_ grid: [[Int]]) -> Int {
        let rows = grid.count  // 行
        let cols = grid.first?.count ?? 0 // 列
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        dp[0][0] = grid[0][0]
        // 第0行
        for col in 1..<cols {
            dp[0][col] = dp[0][col-1] + grid[0][col]
        }
        // 第0列
        for row in 1..<rows {
            dp[row][0] = dp[row-1][0] + grid[row][0]
        }
        // 以上是开始dp的先提条件，也是固定不会变的数值
        for row in 1..<rows {
            for col in 1..<cols {
                // 从自己的左边或上边取最大值，确定自身的值
                dp[row][col] = max(dp[row-1][col], dp[row][col-1]) + grid[row][col]
            }
        }
        return dp[rows-1][cols-1]
    }
}
