import UIKit


// MARK: - Problem Statement
// Find Factorial of a given number

// MARK: - Solution Steps
// we make recursive calls for (n-1)th number
// breaking condition for recursive calls -- we check if n == 1

// MARK: - Solution Pseudocode

func factorial(_ num: Int) -> Int {
    if num == 1 {
        return 1
    }
    return num * factorial(num -  1)
}

print(factorial(10))
