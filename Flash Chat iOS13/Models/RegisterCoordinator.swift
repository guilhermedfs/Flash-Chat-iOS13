//
//  RegisterCoordinator.swift
//  Flash Chat iOS13
//
//  Created by Guilherme Fernandes - pessoal on 07/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class RegisterCoordinator: BaseCoordinator {
    
    override func start() {
        let vc = RegisterViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func ChatScreen() {
        let child = ChatCoordinator(navigationController: navigationController, childCoordinators: [])
        childCoordinators.append(child)
        child.start()
    }
    
    override func finalize() {
        parentCoordinator?.removeDependency(coordinator: self)
    }
}

