//
//  AddPostViewController.swift
//  Tweets
//
//  Created by Axity on 08/10/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import UIKit
import Simple_Networking
import SVProgressHUD
import NotificationBannerSwift
class AddPostViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var addPostButton: UIButton!
    // Actions
    @IBAction func addPostAction() {
        performaceNewPost()
    }
    @IBAction func dissmissAction() {
        dismiss(animated: true, completion: nil)
    }
    // MARK: Life Cicles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: Private Methods
    private func setupUI() {
        addPostButton.layer.cornerRadius = 15
    }
    private func performaceNewPost() {
        SVProgressHUD.show()
        guard let newPost = postTextView.text, !newPost.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes ingresar un Tweet", style: .danger).show()
            return
        }
        let request = PostRequestLocation(text: postTextView.text, imageUrl: nil, videoUrl: nil, location: nil)
        SN.post(endpoint: Endpoints.post, model: request) { (response: SNResultWithEntity<PostResponse, ErrorResponse>) in
            SVProgressHUD.dismiss()
            switch response {
            case .success:
                NotificationBanner(subtitle: "Publicación con éxito", style: .success).show()
                self.dismiss(animated: true, completion: nil)
            case .error(let error):
                NotificationBanner(title: "Error",subtitle: "\(error.localizedDescription)", style: .danger).show()
            case .errorResult(let entity):
                NotificationBanner(title: "Error",subtitle: "Hubo un error: \(entity.error)", style: .danger).show()
            }
        }
    }
}
