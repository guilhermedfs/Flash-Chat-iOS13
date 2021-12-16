//
//  ChatViewModel.swift
//  Flash Chat iOS13
//
//  Created by Guilherme Fernandes - pessoal on 12/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import Firebase

class ChatViewModel {
    
    var delegate: PopToRoot?
    let db = Firestore.firestore()
    var messages: [Message] = []
    
    func logoutUser() {
        let firebaseAuth = Auth.auth()
       do {
         try firebaseAuth.signOut()
           delegate?.popToRoot()
       } catch let signOutError as NSError {
         print("Error signing out: %@", signOutError)
       }
    }
    
    func sendMessage(message: String?) {
        if let messageBody = message, let messageSender = Auth.auth().currentUser?.email {
            db.collection(Constansts.FStore.collectionName).addDocument(data: [Constansts.FStore.senderField: messageSender,
                                                                               Constansts.FStore.bodyField: messageBody,
                                                                               Constansts.FStore.dateField: Date().timeIntervalSince1970]){
                error in
                if let e = error {
                    print(e)
                } else {
                    print("Sucess.")
                }
            }
        }
    }
    
    func loadMessages(completionHandler: @escaping ()->Void) {
        db.collection(Constansts.FStore.collectionName)
            .order(by: Constansts.FStore.dateField)
            .addSnapshotListener {
                (querySnapshot, error) in
            
            self.messages = []
            
            if let e = error {
                print("Error retrieving data. \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[Constansts.FStore.senderField] as? String, let messageBody = data[Constansts.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                completionHandler()
                            }
                        }
                    }
                }
            }
        }
    }
    
    func isLoggedIn(message: Message) -> Bool {
        if message.sender == Auth.auth().currentUser?.email {
            return true
        }
        
        return false
    }
}
