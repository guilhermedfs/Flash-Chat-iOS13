//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Guilherme Fernandes - pessoal on 12/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

struct Constansts {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
