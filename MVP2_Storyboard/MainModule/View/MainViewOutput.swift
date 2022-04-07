//
//  MainViewOutput.swift
//  MVP2_Storyboard
//
//  Created by Me on 05.04.2022.
//

import Foundation

protocol MaintViewOutput: AnyObject {
    func  checkNumber(_ number: Int)
    func getGeneratedNumber()
    func getNumbersForButtons()
}
