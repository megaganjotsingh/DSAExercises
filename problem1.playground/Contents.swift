import UIKit

var greeting = "Hello, playground"

var stringArray: [String] = ["Gagan", "Jot", "Gagan", "Singh", "Gagan", "Singh", "Jot", "Singh"]

// find the number of repeatance of element in a given array


func findRepeatanceOfWords(fromGivenArray arr: [String]) -> [String: Int] {
    var repeatanceOfWordsInDictForm: [String: Int] = [:]
    for element in arr {
        if repeatanceOfWordsInDictForm[element] == nil {
            repeatanceOfWordsInDictForm[element] = 1
        } else {
            repeatanceOfWordsInDictForm[element]! += 1
        }
    }
    return repeatanceOfWordsInDictForm
}

print(findRepeatanceOfWords(fromGivenArray: stringArray))
