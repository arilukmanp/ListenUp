//
//  HomeNewCollectionViewCell.swift
//  ListenUp
//
//  Created by Ari on 02/02/23.
//

import UIKit

class HomeNewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundLabelView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    func setup() {
        backgroundLabelView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
    }
}
