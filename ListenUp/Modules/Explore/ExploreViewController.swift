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
    
    var resultPodcast: [Podcast] = []


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        loadData()
    }
    

    // MARK: - Helper
    func setup() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadData() {
        APIService.shared.getNewPodcast(completion: handleResponseSearchPodcast)
    }
    
    func handleResponseSearchPodcast(_ podcasts: [Podcast]) {
        self.resultPodcast = podcasts
        self.tableView.reloadData()
    }
}


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

extension ExploreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
