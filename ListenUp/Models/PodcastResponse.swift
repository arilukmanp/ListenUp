//
//  PodcastResponse.swift
//  ListenUp
//
//  Created by Ari on 03/02/23.
//

import Foundation


struct PodcastResponse: Decodable {
    let resultCount: Int
    let results: [Podcast]
}
