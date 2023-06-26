//
//  ArticleDetailsModel.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 26/06/23.
//

import Foundation

// MARK: - Article
struct Article: Identifiable, Codable {
    var id = UUID()
    let title, pubDate, link, author, guid: String?
    let thumbnail, description, content: String?
    let enclosure: Enclosure?
    let categories: [String]?
    
    enum CodingKeys: String, CodingKey {
        case title, pubDate, link, guid, author, thumbnail, description, content, enclosure, categories
    }
}

// MARK: - Enclosure
struct Enclosure: Codable {
    let link: String?
    let type: String?
    let thumbnail: String?
    
    enum CodingKeys: String, CodingKey {
        case link, type, thumbnail
    }
}
