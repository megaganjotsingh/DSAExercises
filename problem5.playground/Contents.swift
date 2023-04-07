import UIKit

// find Majority Element with occurence at least n/2 or more times

// brute force

func findMajorityElement(_ arr: [Int]) -> Int {
    for i in 0..<arr.count {
        var majorityCount = 1
        
        for j in i..<arr.count {
            if arr[i] == arr[j] {
                majorityCount += 1
            }
        }
        if majorityCount >= arr.count / 2 {
            return arr[i]
        }
    }
    return 0
}

print(findMajorityElement([4, 3, 4]))
// 4

print(findMajorityElement([2, 4, 5, 53, 2, 5, 2, 45, 5, 2, 3, 4]))
// 0

// simplest using DP

func findMajorityElemente(_ arr: [Int]) -> Int {
    var dict: [Int: Int] = [:]
    var highest = (0, 0)
    for i in arr {
        if dict[i] != nil {
            dict[i]! += 1
        } else {
            dict[i] = 1
        }
    }
    for i in dict {
        if highest.1 < i.value {
            highest = (i.key, i.value)
        }
    }
    if highest.1 >= arr.count / 2 {
        return highest.0
    } else {
        return 0
    }
}

print(findMajorityElemente([4, 3, 4]))

print(findMajorityElemente([2, 4, 5, 53, 2, 5, 2, 45, 5, 2, 3, 4]))
