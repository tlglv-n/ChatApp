//
//  AuthViewModel.swift
//  ChatApp
//
//  Created by Nurikk T. on 20.07.2023.
//

import Foundation
import Firebase

class AuthViewModel {
    private let authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
    }
    
    func login(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void) {
        authService.signIn(withEmail: email, password: password) { result in
            switch result {
            case .failure(let user):
                completion(.failure(user))
            case .success(let user):
                completion(.success(user))
            }
        }
    }
    
    func register(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void) {
        authService.createUser(withEmail: email, password: password) { result in
            switch result {
            case .success(let user):
                let userModel = User(email: user.user.email!, password: password)
                completion(.success(userModel))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    func logout() {
        do {
            try authService.signOut()
        } catch let error {
            print("Error signing out: \(error)")
        }
    }
    
}
