//
//  MainPresenter.swift
//  MVP2_Storyboard
//
//  Created by Me on 05.04.2022.
//

import Foundation
class MainPresenter {
    
    
   
    var generatorOfNumbers: GeneratorOfNumbersProtocol
    weak var view: MainViewInput?
    private let buttonsCount = 3
    
    init(generator: GeneratorOfNumbersProtocol, view: MainViewInput) {
        self.generatorOfNumbers = generator
        self.view = view
        
    }

    
    //MARK:- Output
    
    
    private func fillArrayOfNumbersForButtons() -> [Int]? {
        var numbers: [Int] = []
        guard let generatedNumber = generatorOfNumbers.getGeneratedNumber()  else { return nil }
        numbers.append(generatedNumber)
        for _ in 0...(buttonsCount - 2) {
            let randomValue = Int.random(in: 1...10)
            if numbers.contains(randomValue) {
                let anotherValue =  getAnotherValue(currenArrayOfNumbers: numbers)
                numbers.append(anotherValue)
            } else {
                numbers.append(randomValue)
            }
        }
        return numbers.shuffled()
        
    }
    private func getAnotherValue (currenArrayOfNumbers: [Int]) -> Int {
        var anotherValue = Int.random(in: 1...10)
        while currenArrayOfNumbers.contains(anotherValue) {
            anotherValue = Int.random(in: 1...10)
        }
        return anotherValue
    }
    private func nextRound() {
        generatorOfNumbers.generateNumber()
        getGeneratedNumber()
        getNumbersForButtons()

    }
    

}
extension MainPresenter: MaintViewOutput {
    func checkNumber(_ number: Int) {
        if number == generatorOfNumbers.getGeneratedNumber() {
            print("yes")
        }
        else {
            print("no")
        }
        nextRound()
        
            
    }
    
    func getGeneratedNumber()  {
        generatorOfNumbers.generateNumber()
        view?.displayGeneratedNumber(generatorOfNumbers.getGeneratedNumber())
    }
    
    func getNumbersForButtons() {
        let numbers = fillArrayOfNumbersForButtons()
        view?.setupButtons(numbers)
        
    }
}
