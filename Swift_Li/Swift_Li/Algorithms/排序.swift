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
     1. 从头开始比较每一对相邻元素，如果第1个比第2个大，就交换它们的位置.  执行完一轮后，最末尾的元素就是最大的元素
     2. 忽略1中找到的最大元素，重复执行1,(第2次循环结束，倒数第2元素就是倒数第2大的元素) ,直到全部元素有序
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
     
     快速排序的逻辑是，若要对 nums[lo..hi] 进行排序，我们先找一个分界点 p，通过交换元素使得 nums[lo..p-1] 都小于等于 nums[p]，且 nums[p+1..hi] 都大于 nums[p]，然后递归地去 nums[lo..p-1] 和 nums[p+1..hi] 中寻找新的分界点，最后整个数组就被排序了。
     
     先构造分界点，然后去左右子数组构造分界点，你看这不就是一个二叉树的前序遍历吗？
     */
    func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
        let left = 0
        let right = nums.count - 1
        if left < right {
            let partitionIndex = partition(&nums, left, right)
            quickSort(&nums, left, partitionIndex-1)
            quickSort(&nums, partitionIndex+1, right)
        }
    }
    // 获取分区点
    func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        let pivot = left
        var index = pivot + 1
        for i in index...right {
            if nums[i] < nums[pivot] {
                nums.swapAt(i, index)
                index+=1
            }
        }
        nums.swapAt(pivot, index-1)
        return index - 1
    }
    
    
    /**
     计数排序
     */
    func countingSort(_ nums: inout [Int]) {
        var max = nums[0]
        for i in 0..<nums.count {
            if nums[i] > max {
                max = nums[i]
            }
        }
        
        // 元素出现的次数
        var counts = [Int](repeating: 0, count: max+1)
        for i in 0..<nums.count {
            counts[nums[i]]+=1
        }
        print(counts)
        // 按顺序赋值
        var index = 0
        for i in 0..<counts.count {
            while counts[i] > 0 {
                counts[i]-=1
                nums[index] = i
                index+=1
            }
            print(i,nums)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
