//
//  ArticleRepository.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 27/06/23.
//

import Foundation

/// ArticleRepositoryImpl: This Repository Implementation that Follows the UseCase Protocol.
/// UseCase Protocol: every method implemented here should always do completion and return result in `<[Article],Error>` Format
class ArticleRepositoryImpl: UseCase {
    
    /// fetch Articles() :  this method is Void returning method, which is used to fetch the data from the RSS Feed using URLSessions
    /// After the completion of the fetch, Based on response this function will provide:
    ///  - [Article]: on success
    ///  - Error: on failure
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
