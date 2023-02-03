//
//  APIService.swift
//  ListenUp
//
//  Created by Ari on 03/02/23.
//

import Foundation
import Alamofire


struct APIService {
    static let shared: APIService = APIService()
    private init() { }
    
    let BASE_URL: String = "https://itunes.apple.com/search"
    
    func getNewPodcast(completion: @escaping ([Podcast]) -> Void) {
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
    
    func getRecentPodcast(completion: @escaping ([Podcast]) -> Void) {
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
}
