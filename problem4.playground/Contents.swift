import UIKit

// Dynamic Programming in Data Structures and Algorithms
// Divide and conquer approach helps us to design efficient solutions when subproblems are independent. When sub-problems are dependent or repeated, divide and conquer strategy does much more computation than expected, which leads to an exponential time solution. Such types of problems can be efficiently solved using a dynamic programming approach.

//In dynamic programming, we also solve problem by combining solutions to subproblems. But rather than solving same sub-problem repeatedly, we solve each sub-problem once and store calculated value in extra memory or look up table to avoid recomputation. When same sub-problem appears again, we return already stored solution in the memory. This is an idea of Time-Memory Trade-Off, where we use extra space to improve time complexity from exponential to polynomial time.

// MARK: - Problem Statement
// In the Fibonacci sequence, every number is the sum of two preceding numbers. For example: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, …. So we can easily define recurrence relation to calculate nth terms of Fibonacci using (n - 1)th and (n - 2)th term.

// Recursive structure: fib(n) = fib(n - 1) + fib(n - 2)
// Base case: fib(0) = 0 and fib(1) = 1


// MARK: - Soltion Steps

// Here we are solving the problem of finding nth Fibonacci using the solution of finding (n — 1)th and (n — 2)th Fibonacci, where fib(0) and fib(1) are base cases. So we can easily implement the recursive solution by combining the solution of these two sub-problems.

// MARK: - Solution Pseudocode (Recursive)

//func fib(n: Int) -> Int {
//    if n <= 1 {
//        return n
//    }
//
//    return fib(n: n-2) + fib(n: n-1)
//}
//
//print(fib(n: 9))

// MARK: - Solution Pseudocode (Simplest)

func fibS(n: Int) -> Int {
    var a = 0
    var b = 1
    
    for _ in 2...n {
        let temp = b
        b = a + b
        a = temp
    }
    return b
}

print(fibS(n: 50))

// MARK: - Time Complexity

//There are two recursive calls and one addition operation at each step of recursion. In other words, we are doing O(1) operation at each recursive call. So time complexity of finding nth Fibonacci = O(1) * (Total number of recursive calls)
//
//The recursive calls are growing exponentially level by level i.e. 1, 2, 4, 8, 16…, and so on. If we assume that the above tree is full at each level, then the height of recursion tree = n. So total number of recursive calls = 1 + 2 + 4 + 8 …+ 2^n = 2^(n +1) — 1 = O(2^n) [Using the summation formula of geometric series]. So time complexity = O(2^n) * O(1) = O(2^n).

//Critical observation: Input size decreases by 1 on the left side and by 2 on the right sides. It means: The height of the leftmost leaf node will be n and height of rightmost leaf node will be n/2. So the height of leaf nodes will be in the range of [n/2, n]. What would be the precise analysis? The answer is approx equal to (1.6)^n, which comes from the properties of Fibonacci series. Explore and think!
//
//Overall, recursive algorithm of finding nth Fibonacci is a highly inefficient algorithm. Even it will take a long time to generate output for small values of n like 30 or 50 or 70. The critical question is: Why time complexity is growing exponentially? The idea is simple: We are solving same sub-problems again and again during recursion. For example, fib(n - 2) is calculated 2 times, fib(n - 3) is calculated 3 times, and so on. If we move down the recursion tree, the count of repeated sub-problems will increase.
//
//So, due to repeated calculation of sub-problems, time complexity is in exponential order of n. The critical question is: Can we stop repeated computation and improve time complexity? Yes, here comes the awesome idea of dynamic programming! There are two popular techniques to solve problem using dynamic programming: 1) Top-down approach (Memoization) 2) Bottom-up approach (Tabulation)

//Top-down approach (Memoization)
//
//Top down approach of dynamic programming is an just an optimized version of the inefficient recursive approach. Here, instead of solving same sub-problems several times, we store their solutions in an extra memory when we encounter the sub-problem first time during recursion. If we again encounter the same sub-problem during recursion, we first check for their solution stored in extra memory. If sub-problem solution is already calculated, we return that value instead of calculating that sub-problem again.
//
//There is a critical question: What would be the size of extra memory? The idea is simple: We need to allocate extra space to store solution of every unique sub-problems encountered during recursion. In other words, the size of extra memory is equal to total number of different subproblems. One more important thing: We need to initialize the table with some empty flag or value to identify that sub-problem solution is not calculated yet.
//
//Let’s understand this using the example of finding nth Fibonacci problem.
//
//Fibonacci solution using top-down memoization
//
//There are total n + 1 different sub-problems in the recursive solution of finding nth Fibonacci, i.e. fib(0), fib(1), fib(2)….., fib(n-2), fib(n-1) and fib(n). So we need extra memory of size n + 1 to store the solution of different sub-problems. Let’s say F[n + 1].
//
//Now we initialize all values in the table with -1, as the value of Fibonacci can’t be negative. This will help us to check whether the solution of sub-problem has already been computed or not. Now we are ready to modify the recursive solution.
//
//If(F[i] < 0): The value of ith Fibonacci has not been computed yet. So we calculate the solution recursively and store it at ith index i.e. F[i] = fib(i — 1) + fib(i — 2). Note: Initial value of i will be n.
//If (F[i] > 0): The solution of ith Fibonacci has already been calculated and stored at F[i]. So we don’t calculate it again and return the value stored at F[i].
//By the end of above process, solution to the sub-problems will be stored in the table. So as a final solution, we return value stored at F[n].
//The role of base case is critical in this process, and we need to define it correctly (Think!). A base case is a situation when recursion reaches the scenario of n = 0 and n =1, for which we already know the solution. So, we can directly store 0 at F[0] and 1 at F[1].
//

// MARK: - Pseudocode of nth Fibonacci using the top-down approach

func fibTopDown(n: Int) -> Int {
    var first: [Int] = [0, 1]
    return fibTopDown(n: n, &first)
}

func fibTopDown(n: Int, _ cache: inout [Int]) -> Int {
    
    if cache.count > n {
        return cache[n]
    }
    let fibNum = fibTopDown(n: n-1, &cache) + fibTopDown(n: n-2, &cache)
    cache.append(fibNum)
    return fibNum
}

print(fibTopDown(n: 50))

// MARK: - Pseudocode of nth Fibonacci using the bottom-up approach

func fibBotttomUp(n: Int) -> Int {
    var cache: [Int] = Array(repeating: 0, count: n)
    cache[0] = 0
    cache[1] = 1
    
    for i in 2..<n {
        cache[i] = cache[i-1] + cache[i-2]
    }
    return cache[n-1] + cache[n-2]
}

print(fibBotttomUp(n: 50))
