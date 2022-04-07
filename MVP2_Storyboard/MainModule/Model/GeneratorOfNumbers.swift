//
//  GeneratorOfNumbers.swift
//  MVP2_Storyboard
//
//  Created by Me on 05.04.2022.
//

import Foundation
protocol GeneratorOfNumbersProtocol {
    func getGeneratedNumber() -> Int?
    mutating func generateNumber()
    
}

struct GeneratorOfNumbers: GeneratorOfNumbersProtocol {
    private var generatedNumber: Int?
    
    
    func getGeneratedNumber() -> Int? {
        return generatedNumber
    }
    
    mutating func generateNumber() {
        generatedNumber = Int.random(in: 1...10)
    }
    
}
