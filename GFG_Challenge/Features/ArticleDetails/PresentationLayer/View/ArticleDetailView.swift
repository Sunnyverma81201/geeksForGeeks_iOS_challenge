//
//  ArticleDetailView.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 27/06/23.
//

import SwiftUI
import Kingfisher

struct ArticleDetailView: View {
    @StateObject var articleDetailViewModel: ArticleDetailViewModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack (alignment: .center, spacing: 20){
                    KFImage(URL(string: articleDetailViewModel.article?.enclosure?.link ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .cornerRadius(20)
                
                HStack {
                    VStack{
                        Text(articleDetailViewModel.article?.title ?? "")
                            .font(Font.custom("RobotoCondensed-Regular", size: 24))
                            .kerning(1)
                            .foregroundColor(Color("HeaderTextColor"))
                            .multilineTextAlignment(.leading)
                        
                            Divider()
                            
                        
                        HStack{
                            Text("")
                                .getFormattedDateAndTime(articleDetailViewModel.article?.pubDate ?? "")
                            
                            Circle()
                                .frame(width: 5, height: 5)
                                
                                
                            Text(articleDetailViewModel.article?.author ?? "No Publisher")
                                .font(Font.custom("Poppoins-Thin", size: 12))
                            
                            Spacer()
                        }
                        .foregroundColor(.gray)
                        
                        
                    }
                    .padding(.vertical,8)
                    
                    
                }
                
                //Categories Chips
                ScrollView(.horizontal,showsIndicators: false){
                
                    HStack{
                        if let categories = articleDetailViewModel.article?.categories{
                            ForEach(categories, id: \.self) { category in
                                ChipView(chipViewModel: ChipViewModel(text: category))
                            }
                        }
                    }
                    
                }
                
                //Article Body
                Text(articleDetailViewModel.article?.content ?? "")
                    .font(Font.custom("Poppins", size: 14))
                    .foregroundColor(.black.opacity(0.9))
                    .padding(.horizontal,4)
                    
            }
            .background()
        .padding(.horizontal)
        }
        
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(articleDetailViewModel: ArticleDetailViewModel(article: sampleArticle))
    }
}
