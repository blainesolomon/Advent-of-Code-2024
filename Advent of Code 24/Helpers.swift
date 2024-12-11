//
//  Helpers.swift
//  Advent of Code 24
//
//  Created by Blaine on 12/2/24.
//

import Foundation

extension String {
    var text: String {
        let fileURL = Bundle.main.url(forResource: self, withExtension: "txt")!
        return try! String(contentsOf: fileURL, encoding: .utf8)
    }
    
    var parseLists: ([Int], [Int]) {
        let lines = split(separator: "\n")
        
        var leftList = [Int]()
        var rightList = [Int]()
        
        for line in lines {
            let numbers = line.split(separator: " ").compactMap { Int($0) }
            leftList.append(numbers[0])
            rightList.append(numbers[1])
        }
        
        return (leftList, rightList)
    }
}
