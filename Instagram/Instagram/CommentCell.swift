//
//  CommentCell.swift
//  Instagram
//
//  Created by rodeo station on 10/17/22.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
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
