//
//  RegisterViewController.swift
//  Tweets
//
//  Created by Axity on 08/10/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import UIKit
import NotificationBannerSwift
import Simple_Networking
import SVProgressHUD
class RegisterViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var namesTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    // MARK: - Actions
    @IBAction func doRegister() {
        performanceRegister()
    }
    // MARK: - Life Cicles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Private Methods
    private func setupUI() {
        navigationController?.navigationBar.isHidden = false
        registerButton.layer.cornerRadius = 15
    }
    private func performanceRegister() {
        view.endEditing(true)
        guard let email = emailTextField.text, !email.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes ingresar un correo", style: .danger).show()
            return
        }
        guard let names = namesTextField.text, !names.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes ingresar nombre y apellido", style: .danger).show()
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes ingresar una contraseña", style: .danger).show()
            return
        }
        // Logica para el registro
        SVProgressHUD.show()
        let request = RegisterRequest(email: email, names: names, password: password)
        SN.post(endpoint: Endpoints.register, model: request) { (response: SNResultWithEntity<LoginResponse, ErrorResponse>) in
            SVProgressHUD.dismiss()
            switch response {
            case .success(let user):
                NotificationBanner(subtitle: "Bienvenido: \(user.user.names)", style: .success).show()
                self.performSegue(withIdentifier: "showHome", sender: nil)
                SimpleNetworking.setAuthenticationHeader(prefix: "", token: user.token)
            case .error(let error):
                NotificationBanner(title: "Error", subtitle: "Hubo un error: \(error.localizedDescription)", style: .danger).show()
            case .errorResult(let entity):
                NotificationBanner(title: "Error", subtitle: "Hubo un error: \(entity.error)", style: .danger).show()
            }
        }
    }
}
