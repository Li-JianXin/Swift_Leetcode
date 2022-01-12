//
//  _739_.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/5/6.
//

/**
 https://leetcode-cn.com/problems/daily-temperatures/
 739. 每日温度
 请根据每日 气温 列表，重新生成一个列表。对应位置的输出为：要想观测到更高的气温，至少需要等待的天数。如果气温在这之后都不会升高，请在该位置用 0 来代替。
 
 例如，给定一个列表 temperatures = [73, 74, 75, 71, 69, 72, 76, 73]，你的输出应该是 [1, 1, 4, 2, 1, 1, 0, 0]。
 提示：气温 列表长度的范围是 [1, 30000]。每个气温的值的均为华氏度，都是在 [30, 100] 范围内的整数。
 */

import Foundation

class Stack_739_Solution {
    // 常规思路是暴力法，推荐思路是使用单调栈:只需要遍历一次，时间复杂度O(n)
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        // 使用数组
        var stack: [Int] = []
        var res: [Int] = Array(repeating: 0, count: T.count)
        
        for i in 0..<T.count {
            while stack.count != 0 && T[i] > T[stack.last!] {
                let last = stack.removeLast()
                res[last] = i - last
            }
            stack.append(i)
        }
        return res
    }
}
