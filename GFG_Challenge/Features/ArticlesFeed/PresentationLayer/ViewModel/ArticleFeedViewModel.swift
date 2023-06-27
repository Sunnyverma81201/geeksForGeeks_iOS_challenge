//
//  ArticleFeedViewModel.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 26/06/23.
//

import Foundation

//ViewModel for ArticleFeedView: Takes articleRepositoryImpl as parameter
class ArticleFeedViewModel: ObservableObject {
    //MARK: Variables
    private let articleRepositoryImpl: ArticleRepositoryImpl
    
    @Published var articles: [Article?] = []
    @Published var isFetching: Bool = false //to toggle the loading UI
    
    //MARK: Constructor
    init(articleRepositoryImpl: ArticleRepositoryImpl) {
        self.articleRepositoryImpl = articleRepositoryImpl
    }
    
    //MARK: methods
    func fetchArticles(){
    isFetching = true
    articleRepositoryImpl.fetchArticles { [weak self] result in
            DispatchQueue.main.async {
                self?.isFetching = false
                switch result {
                    case .success(let articles):
                        self?.articles = articles
                    case .failure(let error):
                        print("Failed to fetch articles: \(error)")
                }
            }
        }
    }
}
