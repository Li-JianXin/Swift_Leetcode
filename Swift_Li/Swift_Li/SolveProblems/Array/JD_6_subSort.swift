//
//  JD_6_subSort.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/25.
//

/**
 https://leetcode-cn.com/problems/sub-sort-lcci/
 部分排序
 给定一个整数数组，编写一个函数，找出索引m和n，只要将索引区间[m,n]的元素排好序，整个数组就是有序的。注意：n-m尽量最小，也就是说，找出符合条件的最短序列。函数返回值为[m,n]，若不存在这样的m和n（例如整个数组是有序的），请返回[-1,-1]。
 */
/**
 输入： [1,2,4,7,10,11,7,12,6,7,16,18,19]
 输出： [3,9]
 */
import Foundation

class JD_SubSort_6 {
    func subSort(_ array: [Int]) -> [Int] {
        /*
         只要将[m,n]之间的排好序，整个数组就是有序的，也就是除了[m,n]其它段是有序的 但题目没有明确有序的部分是从小到大 还是从大到小
         通过遍历，找出不在顺序的元素，如遍历到7，没有递增，反而比之前小了
         
         原理：如果左侧最大值大于中间的最小值，则一定会被中间序列包括；同理，如果右侧最小值大于中间的最大值，则一定会被中间序列包括。
         从前向后扫描数组，判断当前array[i]是否比max小，是将last置为当前array下标i，否则更新max
         从后向前扫描数组，判断当前的array[len - i - 1]是否比min大，是的话将firstg更新，否则更新min
         */
        var left = -1
        var right = -1
        
        if array.count == 0 || array.count == 1 || array.count == 2 {
            return [left, right]
        }
        
        var max = array.first!
        var min = array.last!
        
        for i in 1..<array.count {
            let value = array[i]
            if value < max {
                left = i
            } else {
                max = value
            }
        }
        for i in (0..<array.count-1).reversed() {
            let value = array[i]
            if value > min {
                right = i
            } else {
                min = value
            }
        }
        return [right ,left]
    }
    
}
