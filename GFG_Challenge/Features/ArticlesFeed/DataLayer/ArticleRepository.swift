//
//  ArticleRepository.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 27/06/23.
//

import Foundation

class ArticleRepositoryImpl: UseCase {
    func fetchArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        let url = URL(string: "https://api.rss2json.com/v1/api.json?rss_url=http://www.abc.net.au/news/feed/51120/rss.xml")!
        async {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let response = try decoder.decode(RSSResponse.self, from: data)
                let articles = response.items
                completion(.success(articles))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
