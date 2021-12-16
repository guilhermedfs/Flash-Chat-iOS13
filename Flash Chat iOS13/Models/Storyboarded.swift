//
//  Storyboarded.swift
//  Flash Chat iOS13
//
//  Created by Guilherme Fernandes - pessoal on 07/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func  instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
