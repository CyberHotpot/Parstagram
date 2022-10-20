//
//  PostCell.swift
//  Instagram
//
//  Created by rodeo station on 10/14/22.
//

import UIKit

class PostCell: UITableViewCell {

    //post
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    //header
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pictureView.layer.cornerRadius=pictureView.frame.size.width/2
        pictureView.layer.masksToBounds=true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
