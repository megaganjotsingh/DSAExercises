import UIKit

var greeting = "Hello, playground"

// reverse string

func reverseString(_ str: String) -> String {
    var result: String = ""
    
    for c in str {
        result.insert(c, at: result.startIndex)
    }
    return result
}

print(reverseString(greeting))
