//
//  MainViewInput.swift
//  MVP2_Storyboard
//
//  Created by Me on 05.04.2022.
//

import Foundation


protocol MainViewInput: AnyObject{
    func  showResult(_ result: Bool)
    func displayGeneratedNumber(_ number: Int?)
    func setupButtons(_ numbers: [Int]?)
}
