//
//  TweetTableViewCell.swift
//  Tweets
//
//  Created by Axity on 08/10/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import UIKit
import Kingfisher
class TweetTableViewCell: UITableViewCell {
    // MARK: - Outlest
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var tweetImageView: UIImageView!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCellWith(post: PostResponse) {
        nameLabel.text = post.author.names
        nickNameLabel.text = post.author.nickname
        messageLabel.text = post.text
        if post.hasImage {
            tweetImageView.kf.setImage(with: URL(string: post.imageUrl))
        } else {
            tweetImageView.isHidden = true
        }
        dateLabel.text = post.createdAt
    }
    
}
