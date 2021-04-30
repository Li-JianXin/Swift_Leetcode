//
//  _88_merge.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/23.
//
/**
 https://leetcode-cn.com/problems/merge-sorted-array/
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。
 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。你可以假设 nums1 的空间大小等于 m + n，这样它就有足够的空间保存来自 nums2 的元素。
 */

/**
 输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 输出：[1,2,2,3,5,6]
 */


import Foundation

class Merge_88 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: inout [Int], _ n: Int) {
        // nums1 nums2 都是排好序的
        // 采用3指针
        var i = m - 1 // 数组1的指针
        var j = n - 1  // 数组2的指针
        var index = m + n - 1  //数组1队尾的指针 插入元素用
        
        while j >= 0 {  // i j 可能越界，所以要加条件判断
            if i >= 0 && (nums1[i] > nums2[j]) {
                nums1[index] = nums1[i]
                i -= 1
            } else {
                nums1[index] = nums2[j]
                j -= 1
            }
            index -= 1
        }
    }
}
