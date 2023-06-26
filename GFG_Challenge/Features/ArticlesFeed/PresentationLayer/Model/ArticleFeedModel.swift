//
//  ArticleFeedModel.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 26/06/23.
//

import Foundation

// MARK: - RSS
struct RSSResponse: Codable {
    let status: String
    let feed: Feed
    let items: [Article]
}

// MARK: - Feed
struct Feed: Codable {
    let url: String
    let title: String
    let link: String
    let author, description: String
    let image: String
}
