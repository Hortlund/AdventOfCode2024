//
//  Day1.swift
//  AdventOfCode2024
//
//  Created by Andreas Hortlund on 2024-12-08.
//

class Day1: PuzzleDay {
    let day = 1
    private let input: String
    
    init() {
        guard let inputData = FileReader.readFile(named: "Day1.txt") else {
            fatalError("Failed to read input for Day 1")
        }
        self.input = inputData
    }
    
    func Part1() -> String {
        let lines = input.split(separator: "\n")
        
        var leftNumbers: [Int] = []
        var rightNumbers: [Int] = []
        
        for line in lines {
            let components = line.split { $0.isWhitespace }
            if components.count >= 2 {
                if let left = Int(components[0]), let right = Int(components[1]) {
                    leftNumbers.append(left)
                    rightNumbers.append(right)
                }
            }
        }
        
        leftNumbers.sort()
        rightNumbers.sort()
        
        var totalDistance = 0
        for (left, right) in zip(leftNumbers, rightNumbers) {
            totalDistance += abs(left - right)
        }
        
        return "Day 1 Part 1: Total Distance is \(totalDistance)"
    }
    
    func Part2() -> String {
        let lines = input.split(separator: "\n")
        
        var leftNumbers: [Int] = []
        var rightNumbers: [Int] = []
        
        var rightFrequency: [Int: Int] = [:]
        
        for line in lines {
            let components = line.split { $0.isWhitespace }
            if components.count >= 2 {
                if let left = Int(components[0]), let right = Int(components[1]) {
                    leftNumbers.append(left)
                    rightNumbers.append(right)
                }
            }
        }
        
        for number in rightNumbers {
            rightFrequency[number, default: 0] += 1
        }
        
        let similarityScore = leftNumbers.reduce(0) { (result, number) in
            let count = rightFrequency[number] ?? 0
            return result + (number * count)
        }
        
        return "Day 1 Part 2: Similarity Score is \(similarityScore)"
    }
}
