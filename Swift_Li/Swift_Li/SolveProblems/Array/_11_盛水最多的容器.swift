//
//  _11_maxArea.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/20.
//

/*
 https://leetcode-cn.com/problems/container-with-most-water/
 题解： https://leetcode-cn.com/problems/container-with-most-water/solution/on-shuang-zhi-zhen-jie-fa-li-jie-zheng-que-xing-tu/
 
 盛水最多的容器
 
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

 示例：
 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
 */

/*
 当前柱子是最两侧的柱子，水的宽度d，d 为最大，其他的组合，水的宽度都比这个小。
 左边柱子较短，决定了水的高度为 3。如果移动左边的柱子，新的水面高度不确定，一定不会超过右边的柱子高度 7。
 如果移动右边的柱子，新的水面高度一定不会超过左边的柱子高度 3，也就是不会超过现在的水面高度。
 
 不断排除小于当前值的高度
 */

import Foundation

class Array_MaxArea_11 {
    func maxArea(_ height: [Int]) -> Int {
        /*
         双指针法
         指针每一次移动，都意味着排除掉了一个柱子
        
         一开始两端柱子组成的容器能盛的水 数组9个元素，最边上两个元素之间有8个距离，左右值分别是1，7 容器能放的内容取决于小的那个值 也就是1
         所以两端柱子组成的容器面积为 8*1 = 8
         var left = 0;
         var right = height.count - 1
         return (right - left) * min(height[left], height[right])
        */
        
        /*
         对O(n)的算法写一下自己的理解，一开始两个指针一个指向开头一个指向结尾，此时容器的底是最大的，接下来随着指针向内移动，会造成容器的底变小，在这种情况下想要让容器盛水变多，就只有在容器的高上下功夫。 那我们该如何决策哪个指针移动呢？我们能够发现不管是左指针向右移动一位，还是右指针向左移动一位，容器的底都是一样的，都比原来减少了 1。这种情况下我们想要让指针移动后的容器面积增大，就要使移动后的容器的高尽量大，所以我们选择指针所指的高较小的那个指针进行移动，这样我们就保留了容器较高的那条边，放弃了较小的那条边，以获得有更高的边的机会。
         */
        
        var left = 0
        var right = height.count - 1
        var maxArea = 0
        
        while left < right {
            let area = (right - left) * min(height[right], height[left])
            maxArea = max(area, maxArea)
            
            if height[left] < height[right] {
                left+=1
            } else {
                right-=1
            }
        }
        return maxArea
    }
    
    func maxArea1(_ height: [Int]) -> Int {
        // 遍历两次
        // 计算出每2个柱子之间的面积，取出最大值
        // 时间复杂度O(n^2)
        var maxArea = 0
        for i in 0..<height.count-1 {
            for j in 0..<height.count {
                let area = (j-i) * min(height[i], height[j])
                maxArea = max(maxArea, area)
            }
        }
        return maxArea
    }
}
