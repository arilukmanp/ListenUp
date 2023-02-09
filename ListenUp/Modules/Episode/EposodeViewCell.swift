//
//  EposodeViewCell.swift
//  ListenUp
//
//  Created by Ari on 09/02/23.
//

import UIKit

class EposodeViewCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
