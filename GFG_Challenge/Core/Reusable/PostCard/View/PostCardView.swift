//
//  PostCardView.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 26/06/23.
//

import SwiftUI
import Kingfisher

struct PostCardView: View {
    @StateObject var postCardViewModel: PostCardViewMdoel
    
    var body: some View {
        NavigationLink(destination: ArticleDetailView(articleDetailViewModel: ArticleDetailViewModel(article: postCardViewModel.article)), isActive: $postCardViewModel.showDetails){
            VStack (alignment: .center, spacing: 20){
                if postCardViewModel.isTopArticle {
                    KFImage(URL(string: postCardViewModel.article?.enclosure?.link ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                }
                
                HStack {
                    VStack{
                        Text(postCardViewModel.article?.title ?? "")
                            .font(Font.custom("RobotoCondensed-Regular", size: postCardViewModel.isTopArticle ? 24 : 18))
                            .kerning(1)
                            .foregroundColor(Color("HeaderTextColor"))
                            .multilineTextAlignment(.leading)
                        
                        if postCardViewModel.isTopArticle {
                            Divider()
                            
                        }
                        
                        Spacer()
                        HStack{
                            Text("")
                                .getFormattedDateAndTime(postCardViewModel.article?.pubDate ?? "")
                            Spacer()
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical,8)
                    
                    if !postCardViewModel.isTopArticle {
                        KFImage(URL(string: postCardViewModel.article?.thumbnail ?? ""))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                    }
                }
                
                
            }
            .background()
            .cornerRadius(20)
            .padding(.horizontal)
            .onTapGesture {
                postCardViewModel.showDetails.toggle()
            }
        }
    }
}

struct PostCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("AppBackground")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: true){
                PostCardView(postCardViewModel: PostCardViewMdoel(isTopArticle: true, article: sampleArticle))
                    .shadow(color: .black.opacity(0.1), radius: 8)
                
                PostCardView(postCardViewModel: PostCardViewMdoel(isTopArticle: false, article: sampleArticle))
                    .shadow(color: .gray.opacity(0.1), radius: 8)
                
            }
        }
    }
}

