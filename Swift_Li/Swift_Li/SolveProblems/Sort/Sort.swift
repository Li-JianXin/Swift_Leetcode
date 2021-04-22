//
//  Sort.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/22.
//

// https://www.cnblogs.com/onepixel/p/7674659.html
// https://blog.csdn.net/qq_31116753/article/details/84103610

import Foundation

class Sort {
    /**
     选择排序
     每次找到最小值，然后放到待排序数组的起始位置
     */
    func selectionSort(_ nums: inout [Int]) {
        for i in 0..<nums.count {
            var minIndex = i
            var temp: Int
            for j in i+1..<nums.count {
                if nums[j] < nums[minIndex] { // 寻找最小的数
                    minIndex = j // 最小数的索引
                }
            }
            // 最小索引没有发生变化 跳过
            if minIndex == i {
                continue
            }
            // 将最小数的插入到本次遍历的起始位置，同时把原来的原素换过来
            temp = nums[i]
            nums[i] = nums[minIndex]
            nums[minIndex] = temp
        }
    }
    
    /**
     插入排序
     从前到后逐步构建有序序列；对于未排序数据，在已排序序列中从后向前扫描，找到相应的位置插入
     */
    func insertionSort(_ nums: inout [Int]) {
        if nums.count <= 1 {
            return
        }
        var preIndex: Int
        for i in 1..<nums.count {
            let num = nums[i]
            preIndex = i-1
            while preIndex >= 0 && nums[preIndex] > num {
                nums[preIndex+1] = nums[preIndex]
                preIndex-=1
            }
            nums[preIndex+1] = num
        }
    }
    
    func insertionSort1(_ nums: inout [Int]) {
        for i in 1..<nums.count {
            let value = nums[i]
            // 查找插入的位置
            var preIndex = i
            for j in (0...i-1).reversed() {  // 第一层遍历，就是取出里边的每个值，和前边已经排序过的数字进行比较，然后选择合适的位置插入，插入前需要把插入位置后面的元素后移
                if nums[j] > value {
                    nums[j+1] = nums[j]  // 将比目标值大的元素后移一位，此是j就是需要插入的位置，记录j
                    preIndex = j
                }
            }
            nums[preIndex] = value
        }
    }
    
    /**
     选择和插入的区别
     选择是先找到一轮里的最小数，将最小数放到本次遍历的索引上，如第一次，索引0，找到最小数放到0上，第二次遍历，找到剩下数组里的最小数，也就是倒数第二小的数，放到索引1上，一直下去
     插入是先在前面确定一个排序数组，比如认为第一个是排序好的，遍历的时候，从第二个数开始取值，判断要插入到前面排好序的数组中的哪个位置
     */
    
    /**
     冒泡排序
     嵌套循环，每次查看相邻的元素，如果逆序，则交换
     */
    func bubbleSort(_ nums: inout [Int]) {
        for _ in 0..<nums.count {
            for j in 0..<nums.count-1 {
                if nums[j] > nums[j+1] { // 如果j的值大于下一位，和下一位的值进行交换
                    let temp = nums[j+1]
                    nums[j+1] = nums[j]
                    nums[j] = temp
                }
            }
        }
    }
    
// MARK: - O(nlogn)
    
    /**
     归并排序
     分治思想，将已有序的子序列合并，得到完全有序的序列；即先使每个子序列有序，再使子序列段间有序。若将两个有序表合并成一个有序表，称为2-路归并。
     把长度为n的输入序列分成两个长度为n/2的子序列；
     对这两个子序列分别采用归并排序；
     将两个排序好的子序列合并成一个最终的排序序列。
     */
    func mergeSort(_ nums: inout [Int]) -> [Int] {
        if nums.count < 2 {
            return nums
        }
        // 将每个传进来的数组从中间分为左右2个
        let middle = nums.count / 2
        var left = Array(nums[0..<middle])
        var right = Array(nums[middle..<nums.count])
        // 对左右2个数组归并
        var mergeLeft = mergeSort(&left)
        var mergeRight = mergeSort(&right)
        // 将左右排序你合并
        return merge(&mergeLeft, &mergeRight)
    }
    func merge(_ left: inout [Int], _ right: inout [Int]) -> [Int] {
        var result = [Int]()
        
        while left.count>0 && right.count>0 {
            if left[0] < right[0] {
                result.append(left.removeFirst())
            } else {
                result.append(right.removeFirst())
            }
        }
        
        while left.count != 0 {
            result.append(left.removeFirst())
        }
        while right.count != 0 {
            result.append(right.removeFirst())
        }
        
        return result
    }
    
    /**
     快速排序
     通过一趟排序将待排记录分隔成独立的两部分，其中一部分记录的关键字均比另一部分的关键字小，则可分别对这两部分记录继续进行排序，以达到整个序列有序
     分治思想，挑一个元素作为基准，把数组分成2部分，如比基准小的放左边，比基准大的放右边。一次结束后，基准处在中间。递归
     */
    func quickSort(_ nums: inout [Int]) {
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
