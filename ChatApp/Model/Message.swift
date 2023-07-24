//
//  Message.swift
//  ChatApp
//
//  Created by Nurikk T. on 24.07.2023.
//

import Foundation

struct Message {
  let message: String
  let senderUsername: String
  let messageSender: MessageSender
  
  init(message: String, messageSender: MessageSender, username: String) {
    self.message = message.withoutWhitespace()
    self.messageSender = messageSender
    self.senderUsername = username
  }
}
