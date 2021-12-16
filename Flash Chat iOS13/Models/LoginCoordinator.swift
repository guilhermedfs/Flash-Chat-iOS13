//
//  LoginCoordinator.swift
//  Flash Chat iOS13
//
//  Created by Guilherme Fernandes - pessoal on 07/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class LoginCoordinator: BaseCoordinator {
    
    override func start() {
        let vc = LoginViewController.instantiate()
        vc.coordinator = self

//        let appearance = UINavigationBarAppearance()
//        appearance.backgroundColor = .white
//
//        navigationController.navigationBar.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
//        navigationController.navigationBar.standardAppearance = appearance
//        navigationController.navigationBar.compactAppearance = appearance
//        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.pushViewController(vc, animated: true)
    }
    
    func ChatScreen() {
        let child = ChatCoordinator(navigationController: navigationController, childCoordinators: childCoordinators)
        childCoordinators.append(child)
        child.start()
    }
    
    override func finalize() {
        parentCoordinator?.removeDependency(coordinator: self)
    }
}

