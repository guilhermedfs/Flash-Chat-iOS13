//
//  RegisterViewModel.swift
//  Flash Chat iOS13
//
//  Created by Guilherme Fernandes - pessoal on 11/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import Firebase

class RegisterViewModel {
    
    weak var coordinator: RegisterCoordinator?
    var delegate: ProceedProtocol?

    func registerUser(email: String?, password: String?){
        guard let em = email else {
            return
        }
        guard let pass = password else {
            return
        }
        
        Auth.auth().createUser(withEmail: em, password: pass) { authResult, error in
            if let e = error {
                self.delegate?.showAlert(alertMessage: e.localizedDescription)
            } else {
                self.delegate?.chatScreen()
            }
        }
    }
}
