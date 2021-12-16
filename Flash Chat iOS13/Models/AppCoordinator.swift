//
//  BaseCoordinator.swift
//  Flash Chat iOS13
//
//  Created by Guilherme Fernandes - pessoal on 07/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    override func start() {
        let vc = WelcomeViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func LoginScreen() {
        let child = LoginCoordinator(navigationController: navigationController, childCoordinators: [])
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    func RegisterScreen() {
        let child = RegisterCoordinator(navigationController: navigationController, childCoordinators: [])
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
}
