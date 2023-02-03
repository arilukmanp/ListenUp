//
//  Podcast.swift
//  ListenUp
//
//  Created by Ari on 03/02/23.
//

import Foundation


struct Podcast: Decodable {
    let collectionId: Int
    let trackId: Int
    let artistName: String
    let collectionName: String
    let trackName: String
    let feedUrl: String
    let trackCount: Int
    let thumbnailArtworkUrl: String
    let largeArtworkUrl: String
    let genres: [String]
    
    enum CodingKeys: String, CodingKey {
        case collectionId
        case trackId
        case artistName
        case collectionName
        case trackName
        case feedUrl
        case trackCount
        case thumbnailArtworkUrl = "artworkUrl100"
        case largeArtworkUrl = "artworkUrl600"
        case genres
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let defaultImageUrl: String = "https://images.theconversation.com/files/258026/original/file-20190208-174861-nms2kt.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=200&h=200.0&fit=crop"

        self.collectionId = try container.decodeIfPresent(Int.self, forKey: .collectionId) ?? 0
        self.trackId = try container.decode(Int.self, forKey: .trackId)
        self.artistName = try container.decodeIfPresent(String.self, forKey: .artistName) ?? ""
        self.collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName) ?? ""
        self.trackName = try container.decode(String.self, forKey: .trackName)
        self.feedUrl = try container.decodeIfPresent(String.self, forKey: .feedUrl) ?? ""
        self.trackCount = try container.decodeIfPresent(Int.self, forKey: .trackCount) ?? 0
        self.thumbnailArtworkUrl = try container.decodeIfPresent(String.self, forKey: .thumbnailArtworkUrl) ?? defaultImageUrl
        self.largeArtworkUrl = try container.decodeIfPresent(String.self, forKey: .largeArtworkUrl) ?? defaultImageUrl
        self.genres = try container.decodeIfPresent([String].self, forKey: .genres) ?? []
    }
}
