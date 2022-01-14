//
//  _253_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/26.
//

/**
 https://leetcode-cn.com/problems/meeting-rooms-ii/
 给你一个会议时间安排的数组 intervals ，每个会议时间都会包括开始和结束的时间 intervals[i] = [starti, endi] ，为避免会议冲突，同时要考虑充分利用会议室资源，请你计算至少需要多少间会议室，才能满足这些会议安排。
 输入：intervals = [[0,30],[5,10],[15,20]]
 输出：2
 */

import Foundation

class Solution253 {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        if intervals.count == 0 {
            return 0
        }
        var intervals = intervals
        intervals.sort { (ary1, ary2) -> Bool in
            return ary1[0] < ary2[0]
        }
        var queue: [[Int]] = []
        queue.append(intervals.first!)
        for i in 1..<intervals.count {
            let interval = intervals[i]
            let queueFirst = queue.first!
            // 当前会议开始时间小于之前最早会议的结束时间
            if interval[0] < queueFirst[1] {
                // 将当前会议插入队头
                queue.insert(interval, at: 0)
            } else {
                //已经有空出的会议室
                queue.removeFirst()
                queue.insert(interval, at: 0)
            }
            
            // 由于swift不带自优先级队列（大顶堆小顶堆）数据结构，用一个数组排序代替
            queue.sort { (q1, q2) -> Bool in
                return q1[1] < q2[1]
            }
        }
        return queue.count
    }
}
