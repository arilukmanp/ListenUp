//
//  ExploreViewController.swift
//  ListenUp
//
//  Created by Ari on 31/01/23.
//

import UIKit
import Kingfisher


class ExploreViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var resultPodcast: [Podcast] = []


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    

    // MARK: - Helper
    func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        searchController.searchBar.delegate = self
    }
    
    func searchPodcast(_ term: String) {
        APIService.shared.searchPodcast(term: term, completion: handleResponseSearchPodcast)
    }
    
    func handleResponseSearchPodcast(_ podcasts: [Podcast]) {
        self.resultPodcast = podcasts
        self.tableView.reloadData()
    }
}


// MARK: - Extension: Cell Datasource
extension ExploreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultPodcast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "podcast_cell_id", for: indexPath) as! ExploreViewCell
        
        if (self.resultPodcast.count > 0) {
            let podcast = resultPodcast[indexPath.item]
            cell.coverImageView.kf.setImage(with: URL(string: podcast.thumbnailArtworkUrl))
            cell.titleLabel.text = podcast.trackName
            cell.artistLabel.text = podcast.artistName
            cell.trackCountLabel.text = "\(podcast.trackCount) Episodes"
        }
        
        return cell
    }
}


// MARK: - Extension: Cell Delegate
extension ExploreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// MARK: - Extension: SearchBar Delegate
extension ExploreViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchPodcast(searchText)
    }
}
