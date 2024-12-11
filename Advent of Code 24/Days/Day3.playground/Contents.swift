import UIKit


let input = "input1".text



func calculateMultiplicationSum(from input: String) -> Int {
    let pattern = #"\bmul\((\d{1,3}),(\d{1,3})\)"#
    
    let regex = try! NSRegularExpression(pattern: pattern)
    
    let matches = regex.matches(in: input, range: NSRange(input.startIndex..., in: input))
    
    var totalSum = 0
    for match in matches {
        if let xRange = Range(match.range(at: 1), in: input),
           let yRange = Range(match.range(at: 2), in: input) {
            let x = Int(input[xRange])!
            let y = Int(input[yRange])!
            
            totalSum += x * y
        }
    }
    
    return totalSum
}

func calculateConditionalMultiplicationSum(from input: String) -> Int {
    let pattern = #"\b(mul\((\d{1,3}),(\d{1,3})\)|do\(\)|don't\(\))"#
    
    let regex = try! NSRegularExpression(pattern: pattern)
    
    let matches = regex.matches(in: input, range: NSRange(input.startIndex..., in: input))
    
    var isEnabled = true
    var totalSum = 0
    
    for match in matches {
        if let fullRange = Range(match.range, in: input) {
            let fullMatch = String(input[fullRange])
            
            if fullMatch == "do()" {
                isEnabled = true
            } else if fullMatch == "don't()" {
                isEnabled = false
            } else if fullMatch.starts(with: "mul") && isEnabled {
                if let xRange = Range(match.range(at: 2), in: input),
                   let yRange = Range(match.range(at: 3), in: input) {
                    let x = Int(input[xRange])!
                    let y = Int(input[yRange])!
                    
                    totalSum += x * y
                }
            }
        }
    }
    
    return totalSum
}


let result = calculateMultiplicationSum(from: input)

let result2 = calculateConditionalMultiplicationSum(from: input)

