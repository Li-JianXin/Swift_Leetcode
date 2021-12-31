//
//  _252_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/26.
//

/**
 https://leetcode-cn.com/problems/meeting-rooms/
 252. 会议室
 给定一个会议时间安排的数组 intervals ，每个会议时间都会包括开始和结束的时间 intervals[i] = [starti, endi] ，请你判断一个人是否能够参加这里面的全部会议。
 输入：intervals = [[0,30],[5,10],[15,20]]
 输出：false
 */

import Foundation

class Solution252 {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
           if intervals == nil || intervals.count == 0 {
               return true
           }
           var intervals = intervals;
           intervals.sort { (ary1, ary2) -> Bool in
               return ary1[0] < ary2[0]
           }
           for i in 1..<intervals.count {
               if intervals[i][0] < intervals[i-1][1] {
                   return false
               }
           }
           return true
       }
}
