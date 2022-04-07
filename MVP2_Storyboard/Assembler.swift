//
//  MainAssembly.swift
//  MVP2_Storyboard
//
//  Created by Me on 05.04.2022.
//

import Foundation
import UIKit

class Assembler: NSObject {
    
    //MARK: - Build Main Module
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        let generator = GeneratorOfNumbers()
        guard let view = viewController as? MainViewController else { return }
        let presenter = MainPresenter(generator: generator, view: view)
        view.output = presenter
    }
    
    //MARK: - Build Detail Module
    static func createDetailModule() -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "detail")
        return view

    }

}
