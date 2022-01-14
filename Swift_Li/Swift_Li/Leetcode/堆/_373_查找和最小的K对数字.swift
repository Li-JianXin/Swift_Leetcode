//
//  _373_查找和最小的K对数字.swift
//  Swift_Li
//
//  Created by lijianxin03 on 2022/1/14.
//

import Foundation
/*
 https://leetcode-cn.com/problems/find-k-pairs-with-smallest-sums/
 373. 查找和最小的K对数字
 
 给定两个以升序排列的整数数组 nums1 和 nums2 , 以及一个整数 k 。
 定义一对值 (u,v)，其中第一个元素来自 nums1，第二个元素来自 nums2 。
 请找到和最小的 k 个数对 (u1,v1),  (u2,v2)  ...  (uk,vk) 。

 输入: nums1 = [1,7,11], nums2 = [2,4,6], k = 3
 输出: [1,2],[1,4],[1,6]
 解释: 返回序列中的前 3 对数：
      [1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]
 */

class Solution_373 {
    /*
     直接思路就是枚举全部，二次枚举计算出k
     可以使用优先队列（用堆构建），优先队列达到k时返回
     */
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var priorityQueue = [[Int]]()  // 索引数组
        let m = nums1.count
        let n = nums2.count
        var res = [[Int]]()
        for i in 0..<min(m, k) {
            priorityQueue.append([i, 0])
        }
        var k = k
        while k > 0 && priorityQueue.count != 0 {
            let idxPair = priorityQueue.removeFirst()
            var list = [Int]()
            list.append(nums1[idxPair[0]])
            list.append(nums2[idxPair[1]])
            res.append(list)
            if idxPair[1] + 1 < n { // 索引1 对应nums2，不能超过nums2的长度
                /*
                 利用堆的特性可以求出待选范围中最小数对的索引为 (ai ,bi)，
                 同时将新的待选的数对(ai+1,bi),(ai,bi+1) 加入到堆中，直到我们选出 k 个数对即可。
                 理解 ：(ai+1,bi),(ai,bi+1) 就是(ai ,bi)下一个数索引的备选
                 */
                priorityQueue.append([idxPair[0], idxPair[1] + 1])  // 取出下一个放入队列
                priorityQueue.sort { ary1, ary2 in
                    return (nums1[ary1[0]] + nums2[ary1[1]]) < ( nums1[ary2[0]] + nums2[ary2[1]])
                }
            }
            k -= 1
        }
        return res
    }
}
