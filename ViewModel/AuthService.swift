//
//  AuthService.swift
//  ChatApp
//
//  Created by Nurikk T. on 21.07.2023.
//

import Foundation
import Firebase

class AuthService: AuthServiceProtocol {
    private let auth = Auth.auth()
    
    func createUser(withEmail email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else  if let result = result {
                completion(.success(result))
            }
        }
    }
    
    func signIn(withEmail email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user {
                let userModel = User(email: user.email!, password: password)
                completion(.success(userModel))
            }
        }
    }
    
    func signOut() throws {
        try auth.signOut()
    }
}
