//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

protocol ProceedProtocol {
    func chatScreen()
    func showAlert(alertMessage: String)
}

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    weak var coordinator: RegisterCoordinator?
    var registerViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        registerViewModel.delegate = self
        registerViewModel.registerUser(email: emailTextfield.text, password: passwordTextfield.text)
    }
}

extension RegisterViewController: Storyboarded {
    
}

extension RegisterViewController: UIAlertViewDelegate {
    
}

extension RegisterViewController: ProceedProtocol {
    
    func chatScreen() {
        coordinator?.ChatScreen()
    }
    
    func showAlert(alertMessage: String) {
        let alertController = UIAlertController(title: "Error", message: alertMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("ok")
        }
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}


