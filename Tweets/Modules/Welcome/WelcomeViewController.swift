//
//  WelcomeViewController.swift
//  Tweets
//
//  Created by Axity on 08/10/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    // MARK: - Life Cicles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    // MARK: - Private Methods
    private func setupUI() {
        loginButton.layer.cornerRadius = 15
    }
}
