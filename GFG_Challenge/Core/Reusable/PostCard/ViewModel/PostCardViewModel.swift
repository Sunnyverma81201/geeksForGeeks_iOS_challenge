//
//  PostCardModel.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 26/06/23.
//

import Foundation
import SwiftUI

class PostCardViewMdoel: ObservableObject {
    //MARK: Variables
    var isTopArticle: Bool = false
    var article: Article?
    @Published var showDetails: Bool = false
    
    //MARK: Constructor
    init(isTopArticle: Bool, article: Article? = nil) {
        self.isTopArticle = isTopArticle
        self.article = article
    }
}
