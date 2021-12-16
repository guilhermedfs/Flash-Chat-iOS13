//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

protocol PopToRoot {
    func popToRoot()
}

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    weak var coordinator: ChatCoordinator?
    var chatViewModel = ChatViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatViewModel.loadMessages {
            self.tableView.reloadData()
            let indexPath = IndexPath(row: self.chatViewModel.messages.count - 1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constansts.cellNibName, bundle: nil), forCellReuseIdentifier: Constansts.cellIdentifier)
        
        title = Constansts.appName
        
        navigationItem.hidesBackButton = true
        
        let logOut = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logoutPressed))
        self.navigationItem.rightBarButtonItem = logOut
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        chatViewModel.sendMessage(message: messageTextfield.text)
        messageTextfield.text = ""
    }
    
    @objc func logoutPressed() {
        chatViewModel.delegate = self
        chatViewModel.logoutUser()
    }
    
}

extension ChatViewController: Storyboarded {
    
}

extension ChatViewController: PopToRoot {
    
    func popToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatViewModel.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = chatViewModel.messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constansts.cellIdentifier, for: indexPath) as! MessageCell
        
        cell.label.text = message.body
        
        if chatViewModel.isLoggedIn(message: message) {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: "BrandLightPurple")
            cell.label.textColor = UIColor(named: "BrandPurple")
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: "BrandPurple")
            cell.label.textColor = UIColor(named: "BrandLightPurple")
        }
        
        return cell
    }
}

