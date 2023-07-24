//
//  AuthViewController.swift
//  ChatApp
//
//  Created by Nurikk T. on 20.07.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    var authViewModel = AuthViewModel()
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialStates()
        bindViewModel()
    }
    
    private func initialStates() {
        statusLabel?.text = "Please enter your login credentials"
        statusLabel?.textColor = UIColor.lightGray
        
        loginView?.backgroundColor = UIColor(hex: "#14213d")
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
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        DispatchQueue.main.async {
            self.loginViewModel.userLoginPressed(login: (self.emailTextField.text ?? ""), password: (self.passwordTextField.text ?? ""))
            
            if self.loginViewModel.signInProccess() {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let chatListViewController = storyboard.instantiateViewController(withIdentifier: "ChatListViewController") as! ChatListViewController
                
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let sceneDelegate = windowScene.delegate as? SceneDelegate {
                    sceneDelegate.window?.rootViewController = chatListViewController
                }
            }
        }
    }
    @IBAction func signUpButtonPressed(_ sender: Any) {
    }
    
}
