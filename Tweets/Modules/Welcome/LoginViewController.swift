//
//  LoginViewController.swift
//  Tweets
//
//  Created by Axity on 08/10/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import UIKit
import NotificationBannerSwift
import Simple_Networking
import SVProgressHUD
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
        emailTextField.text = "serchtest@test.com"
        passwordTextField.text = "qwerty"
    }
    private func performaceLogin() {
        view.endEditing(true)
        guard let email = emailTextField.text, !email.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes ingresar un correo", style: .danger).show()
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes ingresar una contraseña", style: .danger).show()
            return
        }
        // Logica para el Login
        let request = LoginRequest(email: email, password: password)
        SVProgressHUD.show()
        SN.post(endpoint: Endpoints.login, model: request) { (response: SNResultWithEntity<LoginResponse, ErrorResponse>) in
            SVProgressHUD.dismiss()
            switch response {
            case .success(let user):
                NotificationBanner(subtitle: "Bienvenido: \(user.user.names)", style: .success).show()
                self.performSegue(withIdentifier: "showHome", sender: nil)
                SimpleNetworking.setAuthenticationHeader(prefix: "", token: user.token)
            case .error(let error):
                NotificationBanner(title: "Error",subtitle: "Hubo un error: \(error.localizedDescription)", style: .danger).show()
            case .errorResult(let entity):
                NotificationBanner(title: "Error",subtitle: "Hubo un error: \(entity.error)", style: .danger).show()
            }
        }
    }
}
