//
//  main.swift
//  Swift_Li
//
//  Created by 李建新 on 2021/4/12.
//

import Foundation

print("Hello, World!")

//var nums1 = [1,2,3,0,0,0]
//var nums2 = [2,5,6]
var nums1 = [0,2,2,1,1,0,0,1]
let sort75 = SortColors_75()
sort75.sortColors1(&nums1)
print(":\(nums1)")

