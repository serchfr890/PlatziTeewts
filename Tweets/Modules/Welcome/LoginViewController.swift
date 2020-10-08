//
//  LoginViewController.swift
//  Tweets
//
//  Created by Axity on 08/10/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import UIKit
import NotificationBannerSwift
class LoginViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    //MARK: - Actions
    @IBAction func doLogin() {
        performaceLogin()
    }
    // MARK: - Life Cicles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Private Methods
    private func setupUI() {
        loginButton.layer.cornerRadius = 15
        navigationController?.navigationBar.isHidden = false
    }
    private func performaceLogin() {
        guard let email = emailTextField.text, !email.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes ingresar un correo", style: .danger).show()
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes ingresar una contraseña", style: .danger).show()
            return
        }
        // Logica para el Login
        
    }
}
