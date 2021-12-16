//
//  Message.swift
//  Flash Chat iOS13
//
//  Created by Guilherme Fernandes - pessoal on 12/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

class Message {
    let sender: String
    let body: String
    
    init(sender: String, body: String) {
        self.sender = sender
        self.body = body
    }
}
