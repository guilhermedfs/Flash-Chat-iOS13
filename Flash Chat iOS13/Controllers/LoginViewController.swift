//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    weak var coordinator: LoginCoordinator?
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        loginViewModel.delegate = self
        loginViewModel.signIn(email: emailTextfield.text, password: passwordTextfield.text)
    }
}

extension LoginViewController: Storyboarded {
    
}

extension LoginViewController: ProceedProtocol {
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
