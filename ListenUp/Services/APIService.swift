//
//  APIService.swift
//  ListenUp
//
//  Created by Ari on 03/02/23.
//

import Foundation
import Alamofire
import FeedKit


class APIService {
    static let shared: APIService = APIService()
    private init() { }
    
    let BASE_URL: String = "https://itunes.apple.com/search"
    
    func getNewPodcast(completion: @escaping (_ podcasts: [Podcast]) -> Void) {
        let parameters: [String: Any] = [
            "term": "programming",
            "media": "podcast",
            "limit": 5
        ]
        
        AF.request(BASE_URL, parameters: parameters)
            .responseDecodable(of: PodcastResponse.self) { response in
                switch response.result {
                case .success(let podcastResponse):
                    completion(podcastResponse.results)
                case .failure(let error):
                    print(error.errorDescription ?? error)
                    completion([])
                }
            }
    }
    
    func getRecentPodcast(completion: @escaping (_ podcasts: [Podcast]) -> Void) {
        let parameters: [String: Any] = [
            "term": "swift",
            "media": "podcast",
            "limit": 7
        ]
        
        AF.request(BASE_URL, parameters: parameters)
            .responseDecodable(of: PodcastResponse.self) { response in
                switch response.result {
                case .success(let podcastResponse):
                    completion(podcastResponse.results)
                case .failure(let error):
                    print(error.errorDescription ?? error)
                    completion([])
                }
            }
    }
    
    func searchPodcast(term: String, completion: @escaping (_ podcasts: [Podcast]) -> Void) {
        let parameters: [String: Any] = [
            "term": term,
            "media": "podcast",
            "limit": 20
        ]
        
        AF.request(BASE_URL, parameters: parameters)
            .responseDecodable(of: PodcastResponse.self) { response in
                switch response.result {
                case .success(let podcastResponse):
                    completion(podcastResponse.results)
                case .failure(let error):
                    print(error.errorDescription ?? error)
                    completion([])
                }
            }
    }
    
    func loadEpisodes(url: String, completion: @escaping (_ episodes: [RSSFeedItem]) -> Void ) {
        if let feedUrl = URL(string: url) {
            let parser = FeedParser(URL: feedUrl)
            parser.parseAsync { result in
                switch result {
                case .success(let feed):
                    completion(feed.rssFeed?.items ?? [])
                case .failure(let error):
                    print(error.errorDescription ?? error)
                    completion([])
                }
            }
        } else {
            completion([])
        }
    }
}
