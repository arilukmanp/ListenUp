//
//  EpisodesViewController.swift
//  ListenUp
//
//  Created by Ari on 06/02/23.
//

import UIKit
import FeedKit
import Kingfisher


class EpisodesViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var episodeTableView: UITableView!
    
    var podcast: Podcast!
    var episodes: [RSSFeedItem] = []
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        loadEpisodes()
    }
    
    
    // MARK: - Helper
    func setup() {
        title = podcast.trackName
        
        episodeTableView.dataSource = self
    }
    
    func loadEpisodes() {
        APIService.shared.loadEpisodes(url: podcast.feedUrl) { episodes in
            self.episodes = episodes
            self.episodeTableView.reloadData()
        }
    }
}


// MARK: - Extension: Table Datasource
extension EpisodesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "episode_cell_id", for: indexPath) as! EposodeViewCell
        
        let episode = self.episodes[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyy HH:mm"
        
        cell.thumbImageView.kf.setImage(with: URL(string: episode.iTunes?.iTunesImage?.attributes?.href ?? ""))
        cell.dateLabel.text = episode.pubDate != nil ? dateFormatter.string(from: episode.pubDate!) : ""
        cell.titleLabel.text = episode.title
        cell.descriptionLabel.text = episode.iTunes?.iTunesSubtitle ?? episode.description
        
        return cell
    }
    
    
}
