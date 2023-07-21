//
//  User.swift
//  ChatApp
//
//  Created by Nurikk T. on 21.07.2023.
//

import Foundation
class User {
    private let email: String?
    private let password: String?
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
