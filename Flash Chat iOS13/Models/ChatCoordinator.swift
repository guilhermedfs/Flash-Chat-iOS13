//
//  ChatCoordinator.swift
//  Flash Chat iOS13
//
//  Created by Guilherme Fernandes - pessoal on 07/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ChatCoordinator: BaseCoordinator {
    
    override func start() {
        let vc = ChatViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    override func finalize() {
        parentCoordinator?.removeDependency(coordinator: self)
    }
}
