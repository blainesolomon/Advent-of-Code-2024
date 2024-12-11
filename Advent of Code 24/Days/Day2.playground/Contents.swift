import UIKit

var greeting = "Hello, playground"


func isSafe(report: String) -> Bool {
    let levels = report.split(separator: " ").compactMap { Int($0) }
    
    let differences = zip(levels, levels.dropFirst()).map { $1 - $0 }
    
    let isIncreasing = differences.allSatisfy { $0 >= 1 && $0 <= 3 }
    let isDecreasing = differences.allSatisfy { $0 <= -1 && $0 >= -3 }
    
    return isIncreasing || isDecreasing
}

func countSafeReports(input: String) -> Int {
    let reports = input.split(separator: "\n").map { String($0) }
    return reports.filter { isSafe(report: $0) }.count
}

func isSafe(levels: [Int]) -> Bool {
    let differences = zip(levels, levels.dropFirst()).map { $1 - $0 }
    
    let isIncreasing = differences.allSatisfy { $0 >= 1 && $0 <= 3 }
    let isDecreasing = differences.allSatisfy { $0 <= -1 && $0 >= -3 }
    
    return isIncreasing || isDecreasing
}

func canBeSafeWithDampener(levels: [Int]) -> Bool {
    for i in levels.indices {
        var modifiedLevels = levels
        modifiedLevels.remove(at: i)
        
        if isSafe(levels: modifiedLevels) {
            return true
        }
    }
    return false
}

func countSafeReportsWithDampener(input: String) -> Int {
    let reports = input.split(separator: "\n").map { String($0) }
    
    return reports.reduce(0) { count, report in
        let levels = report.split(separator: " ").compactMap { Int($0) }
        return count + (isSafe(levels: levels) || canBeSafeWithDampener(levels: levels) ? 1 : 0)
    }
}

let input = "input1".text


let safeReportsCount = countSafeReports(input: input)

let safeReportsWithDampener = countSafeReportsWithDampener(input: input)






