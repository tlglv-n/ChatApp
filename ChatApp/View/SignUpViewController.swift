//
//  SignUpViewController.swift
//  ChatApp
//
//  Created by Nurikk T. on 21.07.2023.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var SignUpView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    private var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialState()
        bindViewModel()
    }
    
    private func initialState() {
        SignUpView.backgroundColor = UIColor(hex: "#14213d")
        statusLabel?.text = "Please enter your login credentials"
        statusLabel?.textColor = UIColor.lightGray
        titleLabel?.textColor = UIColor(hex: "#fca311")
    }
    
    private func bindViewModel() {
        loginViewModel.statusText.bind { (statusText) in
            DispatchQueue.main.async {
                self.statusLabel.text = statusText
            }
        }
        
        loginViewModel.statusColor.bind { (statusColor) in
            DispatchQueue.main.async {
                self.statusLabel.textColor = statusColor
            }
        }
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        DispatchQueue.main.async {
            self.loginViewModel.userSignUpPressed(login: (self.emailTextField.text ?? ""), password: self.passwordTextField.text ?? "")
        }
    }
    
    
}
