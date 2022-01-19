//
//  _56_合并区间.swift
//  Swift_Li
//
//  Created by 李建新 on 2022/1/19.
//

import Foundation
/*
 https://leetcode-cn.com/problems/merge-intervals/
 56. 合并区间
 
 以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间。

 输入：intervals = [[1,3],[2,6],[8,10],[15,18]]
 输出：[[1,6],[8,10],[15,18]]
 解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
 */

class Solution_56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count == 0 {
            return [[]]
        }
        // 按照起点升序排列
        let intervals = intervals.sorted { ary1, ary2 in
            return ary1[0] < ary2[0]
        }
        var res = [[Int]]()
        res.append(intervals[0])
        for i in 1..<intervals.count {
            let cur = intervals[i]
            var last = res.last  // res中最后一个元素
            if cur[0] <= last![1] { // 区间相交，合并
                last![1] = max(cur[1], last![1])  // 找到最大end
                res[res.count - 1] = last!
            } else {
                // 下一个待合并区间
                res.append(cur)
            }
        }
        return res
    }
}
