//
//  ExploreViewCell.swift
//  ListenUp
//
//  Created by Ari on 03/02/23.
//

import UIKit

class ExploreViewCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackCountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    // MARK: - Helper
    func setup() {
        coverImageView.layer.cornerRadius = 5
        coverImageView.layer.masksToBounds = true
    }
}
