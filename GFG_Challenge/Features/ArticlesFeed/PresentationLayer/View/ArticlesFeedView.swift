//
//  FeedView.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 26/06/23.
//

import SwiftUI

struct ArticlesFeedView: View {
    @StateObject var articleFeedViewModel: ArticleFeedViewModel
    
    init(articleFeedViewModel: ArticleFeedViewModel) {
        _articleFeedViewModel = StateObject(wrappedValue: articleFeedViewModel)
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            Color("AppBackground")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center){
                //Top Bar
                HStack {
                    Text(TOOL_BAR_TITLE)
                        .font(Font.custom("Poppins-bold", size: 18))
                        .kerning(2)
                        .foregroundColor(.accentColor)
                    Spacer()
                }
                .padding()
                .background()
                
                ScrollView(.vertical, showsIndicators: true){
                        if articleFeedViewModel.isFetching { //Display Loading Ui When Data is loading
                            ProgressView {
                                Text("Fetching")
                            }
                        } else if articleFeedViewModel.articles.isEmpty { //If there is an error and data is not fetched then this view is displayed instead of empty screen
                            NoFeedView()
                        } else {
                            // Top Article
                            PostCardView(postCardViewModel: PostCardViewMdoel(isTopArticle: true, article: articleFeedViewModel.articles[0]))
                                .padding(.bottom,8)
                            
                            // Other Feed Articles
                            VStack(spacing: 15){
                                ForEach(articleFeedViewModel.articles.dropFirst() ,id: \.self?.id) { article in
                                    PostCardView(postCardViewModel: PostCardViewMdoel(isTopArticle: false, article: article))
                                }
                            }
                            .padding(.bottom)
                    }
                    
                }
                .onAppear {
                    articleFeedViewModel.fetchArticles()
                }
                .refreshable {
                    async{
                        articleFeedViewModel.fetchArticles()
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesFeedView(articleFeedViewModel: ArticleFeedViewModel(articleRepositoryImpl: ArticleRepositoryImpl()))
    }
}
