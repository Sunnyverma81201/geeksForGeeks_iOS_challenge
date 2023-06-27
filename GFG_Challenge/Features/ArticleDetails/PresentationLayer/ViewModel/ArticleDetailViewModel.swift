//
//  ArticleDetailViewModel.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 27/06/23.
//

import Foundation
import SwiftUI

class ArticleDetailViewModel: ObservableObject {
    //MARK: Variables
    var article: Article?
    
    //MARK: Constructor
    init(article: Article? = nil) {
        self.article = article
    }
}
