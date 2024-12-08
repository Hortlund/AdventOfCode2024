//
//  main.swift
//  AdventOfCode2024
//
//  Created by Andreas Hortlund on 2024-12-05.
//

import Foundation

func runDay(_ dayNumber: Int) {
    var puzzleDay: any PuzzleDay
    
    switch dayNumber {
    case 1:
        puzzleDay = Day1()
    case 2:
        puzzleDay = Day2()
    default:
        print("Day \(dayNumber) not implemented yet.")
        return
    }
    
    print(puzzleDay.Part1())
    print(puzzleDay.Part2())
}

print("Enter the day number to run (1-24): ", terminator: "")
if let input = readLine(), let day = Int(input), day >= 1 && day <= 25 {
    runDay(day)
} else {
    print("Invalid input. Please enter a number between 1 and 25")
}
