//
//  HomeRecentViewCell.swift
//  ListenUp
//
//  Created by Ari on 01/02/23.
//

import UIKit

class HomeRecentViewCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        thumbnailImageView.layer.cornerRadius = 4
        thumbnailImageView.layer.masksToBounds = true
        thumbnailImageView.backgroundColor = .lightGray
    }

}
