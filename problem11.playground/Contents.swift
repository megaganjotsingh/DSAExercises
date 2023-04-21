import UIKit

// MARK: - Problem Statement

// Given an array X of n integers sorted in ascending order and an integer key, write a program to search for the key in X. If the key exists, then return its index. Otherwise , return -1.

// eg:
// let arr = [-4, 2, 4, 5, 9, 12],
// key = 5, Output = 3
// key = 13, Output = -1

// MARK: - Solution Steps

// we can solve this by follwing linear guess of all the continuous values 1, 2, ... , 16 would be inefficient because with each question, wr eliminate only one number. In the worst case scenario, we need to guess 16 times and the time complexity of this approach is O(n)

// So We will follow binary search algorithm to find the solution

// 1. find the mid point
// 2. first we compare the key to mid point if it matches then we return mid point
// 3 we break given array to two subarray first is (0 to midpoint-1) and second is (midpoint+1 to last) first is array is sorted so we compare the key to (mid point - 1)th element. If key is grater than this, then key may be in right subarray (0 to midpoint-1) otherwise it may be in left subarray (midpoint+1 to last)
// 4. we recursively call 3rd point and declare a condition where it breaks recursive call.


func binarySearch(_ arr: [Int], l: Int, r: Int, key: Int) -> Int {
    if l > r {
        return -1
    }
    
    let midPoint = l + (r - l) / 2
    
    
    if arr[midPoint] == key {
        return midPoint
    } else if arr[midPoint] > key {
        return binarySearch(arr, l: l, r: midPoint-1, key: key)
    } else if arr[midPoint] < key {
        return binarySearch(arr, l: midPoint+1, r: r, key: key)
    }
    return -1
}

let arr = [-4, 2, 4, 5, 9, 12]

print(binarySearch(arr, l: 0, r: arr.count-1, key: 2))
print(binarySearch(arr, l: 0, r: arr.count-1, key: 13))
print(binarySearch(arr, l: 0, r: arr.count-1, key: 6))
print(binarySearch(arr, l: 0, r: arr.count-1, key: 9))

print(binarySearch(arr, l: 0, r: arr.count-1, key: 5))
