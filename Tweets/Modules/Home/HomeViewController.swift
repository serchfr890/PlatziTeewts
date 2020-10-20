//
//  HomeViewController.swift
//  Tweets
//
//  Created by Axity on 08/10/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import UIKit
import SVProgressHUD
import Simple_Networking
import NotificationBannerSwift
class HomeViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Actions
    @IBAction func showNewTweetVC() {
        performSegue(withIdentifier: "showNewTweet", sender: nil)
    }
    // MARK: Properties
    let cellId = "TweetTableViewCell"
    private var dataSource = [PostResponse]()
    // MARK: - Life Cicles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPost()
    }
    // MARK: Private Methods
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    private func getPost() {
        SVProgressHUD.show()
        SN.get(endpoint: Endpoints.post) { (response: SNResultWithEntity<[PostResponse], ErrorResponse>) in
            SVProgressHUD.dismiss()
            switch response {
            case .success(let post):
                self.dataSource = post
                self.tableView.reloadData()
            case .error(let error):
                NotificationBanner(title: "Error",subtitle: "\(error.localizedDescription)", style: .danger).show()
            case .errorResult(let entity):
                NotificationBanner(title: "Error",subtitle: "Hubo un error: \(entity.error)", style: .danger).show()
            }
        }
    }
    private func deletePost(indexPath: IndexPath?) {
        SVProgressHUD.show()
        guard let index = indexPath?.row, index >= 0 else {
            SVProgressHUD.dismiss()
            NotificationBanner(title: "Error", subtitle: "Hubo un error al eliminar el Tweet", style: .success).show()
            return
        }
        let postId = self.dataSource[index].id
        let endpoint = Endpoints.post + "/\(postId)"
        
        SN.delete(endpoint: endpoint) { (response: SNResultWithEntity<GeneralResponse, ErrorResponse>) in
            SVProgressHUD.dismiss()
            switch response {
            case .success:
                self.dataSource.remove(at: index)
                self.tableView.deleteRows(at: [indexPath!], with: .top)
            case .error(let error):
                NotificationBanner(title: "Error",subtitle: "\(error.localizedDescription)", style: .danger).show()
            case .errorResult(let entity):
                NotificationBanner(title: "Error",subtitle: "Hubo un error: \(entity.error)", style: .danger).show()
            }
        }
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        if let cell = cell as? TweetTableViewCell {
            cell.setupCellWith(post: dataSource[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return dataSource[indexPath.row].author.email == "serchtest@test.com"
    }
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Borrar") { (_, _) in
            self.deletePost(indexPath: indexPath)
        }
        return [deleteAction]
    }
}
