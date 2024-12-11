import UIKit

var greeting = "Hello, playground"



func calculateSimilarityScore(leftList: [Int], rightList: [Int]) -> Int {

    var rightCount = [Int: Int]()
    
    for number in rightList {
        rightCount[number, default: 0] += 1
    }
    
    var similarityScore = 0
    for number in leftList {
        let countInRight = rightCount[number, default: 0]
        similarityScore += number * countInRight
    }
    
    return similarityScore
}

func totalDistance(leftList: [Int], rightList: [Int]) -> Int {
    let sortedLeft = leftList.sorted()
    let sortedRight = rightList.sorted()
    
    var totalDistance = 0
    
    for i in 0..<min(sortedLeft.count, sortedRight.count) {
        totalDistance += abs(sortedLeft[i] - sortedRight[i])
    }
    
    return totalDistance
}

func totalDistance(from input: String) -> Int {
    let lists = input.parseLists
    let totalDistance = totalDistance(leftList: lists.0, rightList: lists.1)
    return totalDistance
}


let input = "input1".text
let number = totalDistance(from: "input1".text)


let lists = input.parseLists

calculateSimilarityScore(leftList: lists.0, rightList: lists.1)
