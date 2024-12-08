//
//  Day2.swift
//  AdventOfCode2024
//
//  Created by Andreas Hortlund on 2024-12-08.
//

class Day2: PuzzleDay {
    private let input: String
    
    init() {
        guard let inputData = FileReader.readFile(named: "Day2.txt") else {
            fatalError("Failed to read input for Day 2")
        }
        
        self.input = inputData
    }
    
    func isReportSafe(_ levels: [Int]) -> Bool {
        guard levels.count >= 2 else {
            return true
        }
        
        var isIncreasing = true
        var isDecreasing = true
        
        for i in 1..<levels.count {
            if levels[i] > levels[i - 1] {
                isDecreasing = false
            } else if levels[i] < levels[i - 1] {
                isIncreasing = false
            } else {
                return false
            }
        }
        
        if !isIncreasing && !isDecreasing {
            return false
        }
        
        for i in 1..<levels.count {
            let difference = abs(levels[i] - levels[i - 1])
            if difference < 1 || difference > 3 {
                return false
            }
        }
        
        return true
    }
    
    func Part1() -> String {
        let lines = input.components(separatedBy: .newlines)
        
        var safeCount = 0
        
        for line in lines {
            if line.trimmingCharacters(in: .whitespaces).isEmpty {
                continue
            }
            
            let numbersStrings = line.components(separatedBy: .whitespaces)
            
            let levels = numbersStrings.compactMap { Int($0)}
            
            if isReportSafe(levels) {
                safeCount += 1
            }
        }
        
        return "\(safeCount)"
    }
    
    func Part2() -> String {
        let lines = input.components(separatedBy: .newlines)
        
        var safeCount = 0
        
        for line in lines {
            if line.trimmingCharacters(in: .whitespaces).isEmpty {
                continue
            }
            
            let numbersStrings = line.components(separatedBy: .whitespaces)
            
            let levels = numbersStrings.compactMap { Int($0)}
            
            if isReportSafe(levels) {
                safeCount += 1
                continue
            }
            
            var madeSafe = false
            for i in levels.indices {
                var modifiedLevels = levels
                modifiedLevels.remove(at: i)
                
                if isReportSafe(modifiedLevels) {
                    madeSafe = true
                    break
                }
            }
            
            if madeSafe {
                safeCount += 1
            }
        }
        
        return "\(safeCount)"
    }
}
