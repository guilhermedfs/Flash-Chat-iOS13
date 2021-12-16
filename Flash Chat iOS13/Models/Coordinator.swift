//
//  Coordinator.swift
//  Flash Chat iOS13
//
//  Created by Guilherme Fernandes - pessoal on 07/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject{
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func addDependency(coordinator: Coordinator?)
    func removeDependency(coordinator: Coordinator?)
    func finalize()
}
