//
//  ChatRoomViewController.swift
//  ChatApp
//
//  Created by Nurikk T. on 24.07.2023.
//

import UIKit

class ChatRoomViewController: UIViewController {

    let chatRoom = ChatRoom()
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chatRoom.setupNetworkCommunication()
        chatRoom.joinChat(username: username)
    }
    

}
