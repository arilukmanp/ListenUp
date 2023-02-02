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


// MARK: - Extensions: TableView DataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        default:
            return 7
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "new_cell_id", for: indexPath) as! HomeNewViewCell
            
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.reloadData()
            
            return cell
        default:
            let imageUrl = "https://images.theconversation.com/files/258026/original/file-20190208-174861-nms2kt.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=200&h=200.0&fit=crop"
            let cell = tableView.dequeueReusableCell(withIdentifier: "recent_cell_id", for: indexPath) as! HomeRecentViewCell
            
            cell.numberLabel.text = String(format: "%02d", indexPath.row + 1)
            cell.thumbnailImageView.loadFrom(URLAddress: imageUrl)
            cell.titleLabel.text = "Title at row \(indexPath.row + 1)"
            cell.descriptionLabel.text = "Description at row \(indexPath.row + 1)"
            
            return cell
        }
    }
}


// MARK: - Extensions: CollectionView DataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let imageUrl = "https://images.theconversation.com/files/258026/original/file-20190208-174861-nms2kt.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=200&h=200.0&fit=crop"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_new_cell_id", for: indexPath) as! HomeNewCollectionViewCell
        
        cell.imageView.loadFrom(URLAddress: imageUrl)
        cell.titleLabel.text = "Track \(indexPath.row + 1)"
        cell.descriptionLabel.text = "Description of Track \(indexPath.row + 1 )"
        
        return cell
    }
}


// MARK: - Extensions: CollectionView Delegate FlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
