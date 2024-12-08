//
//  FileReader.swift
//  AdventOfCode2024
//
//  Created by Andreas Hortlund on 2024-12-08.
//

import Foundation

struct FileReader {
    static func readFile(named fileName: String, sourceFilePath: String = #file) -> String? {

        let sourceDirectory = (sourceFilePath as NSString).deletingLastPathComponent
        
        let inputsPath = (sourceDirectory as NSString).appendingPathComponent("Inputs")
        
        let filePath = (inputsPath as NSString).appendingPathComponent(fileName)
        
        print("Attempting to read file at path: \(filePath)")
        
        do {
            let content = try String(contentsOfFile: filePath, encoding: .utf8)
            return content
        } catch {
            print("Error reading file \(fileName): \(error)")
            return nil
        }
    }
}
