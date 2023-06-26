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
    
    //MARK: Constructor
    init(isTopArticle: Bool, article: Article? = nil) {
        self.isTopArticle = isTopArticle
        self.article = article
    }
    
    //MARK: methods
    /// The function accepts date String of FORMAT: yyyy-MM-dd hh:mm:ss
    /// - Returns: a HStack containing Formatted Text(): Views
    func getFromattedDateAndTime(_ date: String) -> some View {
        let dateObj = DateFormatter.jsonDateFormatter.date(from: date)
        
        let formattedDate = DateFormatter.presentableDateFormatter.string(from: dateObj ?? Date())
        let formattedTime = DateFormatter.presentableTimeFormatter.string(from: dateObj ?? Date())
        
        return HStack(spacing: 8){
            Text(formattedDate)
                .font(Font.custom("Poppins-Bold", size: 12))
                
            Text(formattedTime)
                .font(Font.custom("Poppins", size: 12))
        }
        .foregroundColor(.gray)
        
    }
}
