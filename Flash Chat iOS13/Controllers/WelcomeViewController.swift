//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    weak var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let titleText = "⚡️FlashChat"
//        var charIndex = 0.0
//        titleLabel.text = ""
//        for text in titleText {
//            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false, block: { (timer) in
//                self.titleLabel.text?.append(text)
//            })
//            charIndex += 1
//        }
        titleLabel.text = Constansts.appName
       
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        coordinator?.LoginScreen()
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        coordinator?.RegisterScreen()
    }
    
}

extension WelcomeViewController: Storyboarded {
    
}
