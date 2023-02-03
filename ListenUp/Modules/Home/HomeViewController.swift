//
//  HomeViewController.swift
//  ListenUp
//
//  Created by Ari on 31/01/23.
//

import UIKit
import Kingfisher


class HomeViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    var newPodcasts: [Podcast] = []
    var recentPodcasts: [Podcast] = []


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        loadData()
    }
    
    
    // MARK: - Helper
    func setup() {
        tableView.dataSource = self
    }
    
    func loadData() {
        APIService.shared.getNewPodcast(completion: handleResponseNewPodcast)
        APIService.shared.getRecentPodcast(completion: handleResponseRecentPodcast)
    }
    
    func handleResponseNewPodcast(_ podcasts: [Podcast]) {
        self.newPodcasts = podcasts
        self.tableView.reloadData()
    }
    
    func handleResponseRecentPodcast(_ podcasts: [Podcast]) {
        self.recentPodcasts = podcasts
        self.tableView.reloadData()
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
            return self.recentPodcasts.count
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "recent_cell_id", for: indexPath) as! HomeRecentViewCell
            
            if (self.recentPodcasts.count > 0) {
                let podcast = self.recentPodcasts[indexPath.item]
                cell.numberLabel.text = String(format: "%02d", indexPath.row + 1)
                cell.thumbnailImageView.kf.setImage(with: URL(string: podcast.thumbnailArtworkUrl))
                cell.titleLabel.text = podcast.trackName
                cell.descriptionLabel.text = podcast.artistName
            }
            
            return cell
        }
    }
}


// MARK: - Extensions: CollectionView DataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.newPodcasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_new_cell_id", for: indexPath) as! HomeNewCollectionViewCell
        
        if (self.newPodcasts.count > 0) {
            let podcast = self.newPodcasts[indexPath.item]
            cell.imageView.kf.setImage(with: URL(string: podcast.largeArtworkUrl))
            cell.titleLabel.text = podcast.trackName
            cell.descriptionLabel.text = podcast.artistName
        }
        
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
