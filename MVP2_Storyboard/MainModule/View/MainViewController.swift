//
//  ViewController.swift
//  MVP2_Storyboard
//
//  Created by Me on 05.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
 
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var guesedNuberLabel: UILabel!
    
    var output: MaintViewOutput!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.getGeneratedNumber()
        output.getNumbersForButtons()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func guesButtonPressed(_ sender: UIButton) {
        guard let currentTitle  = sender.currentTitle else { return }
        guard let number = Int(currentTitle) else { return }
        output.checkNumber(number)
    
    }
    
    @IBAction func detailButtonPressed(_ sender: Any) {
        let detailModule = Assembler.createDetailModule()
        
        self.present(detailModule, animated: true, completion: nil)
    }
    
   
}

//MARK: - Input

extension MainViewController: MainViewInput {
    func showResult(_ result: Bool) {
        
    }
    
    func displayGeneratedNumber(_ number: Int?) {
        guard let generatedNumber = number else {
            return
        }
        guesedNuberLabel.text = String(generatedNumber)
    }
    
    func setupButtons(_ numbers: [Int]?) {
        guard let myNumbers = numbers  else { return }
        for i in 0...(myNumbers.count - 1) {
            buttons[i].setTitle(String(myNumbers[i]), for: .normal)
        }
                
    }
}
