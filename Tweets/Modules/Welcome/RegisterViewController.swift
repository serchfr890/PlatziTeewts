//
//  RegisterViewController.swift
//  Tweets
//
//  Created by Axity on 08/10/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import UIKit
import NotificationBannerSwift
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
    }
    // MARK: - Private Methods
    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
        registerButton.layer.cornerRadius = 15
    }
    private func performanceRegister() {
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
    }
}
