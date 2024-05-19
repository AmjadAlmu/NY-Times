//
//  ArticleModel.swift
//  NYTimes
//
//  Created by Amjad Almuwallad on 17/05/2024.
//

import Foundation

struct ArticleModelResponse: Decodable {
    let articles: [ArticleModel]
    
    enum CodingKeys: String, CodingKey {
        case articles = "results"
    }
}

struct ArticleModel: Identifiable, Decodable {
    let id: Int
    let publishedDate: String
    let title: String
    let abstract: String
    let media: [Media]

    enum CodingKeys: String, CodingKey {
        case id
        case publishedDate = "published_date"
        case title, abstract, media
    }
    
    
    var mediumImageURL: URL? {
        media
            .flatMap { $0.mediaMetadata }
            .first { $0.format == .mediumThreeByTwo440 }?
            .imageURL
    }
    
    var thumbnailImageURL: URL? {
        media
            .flatMap { $0.mediaMetadata }
            .first { $0.format == .standardThumbnail }?
            .imageURL
    }
}

struct Media: Codable {
    let mediaMetadata: [MediaMetadatum]

    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadatum: Codable {
    let url: String
    let format: Format
    
    var imageURL: URL? {
        URL(string: self.url)
    }
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}
