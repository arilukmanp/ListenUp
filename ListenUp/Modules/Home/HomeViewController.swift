//
//  HomeViewController.swift
//  ListenUp
//
//  Created by Ari on 31/01/23.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    
    // MARK: - Helper
    func setup() {
        tableView.dataSource = self
    }

}


// MARK: - Extensions
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageUrl = "https://images.theconversation.com/files/258026/original/file-20190208-174861-nms2kt.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=200&h=200.0&fit=crop"
        let cell = tableView.dequeueReusableCell(withIdentifier: "recent_cell_id", for: indexPath) as! HomeRecentViewCell
        
        cell.numberLabel.text = String(format: "%02d", indexPath.row + 1)
        cell.thumbnailImageView.loadFrom(URLAddress: imageUrl)
        cell.titleLabel.text = "Title at row \(indexPath.row + 1)"
        cell.descriptionLabel.text = "Description at row \(indexPath.row + 1)"
        
        return cell
    }
}
