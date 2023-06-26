//
//  NoFeedView.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 26/06/23.
//

import SwiftUI

struct NoFeedView: View {
    var body: some View {
        ZStack{
            Color("AppBackground")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Text("Feed not Available")
                Spacer()
            }
            
        }
    }
}

struct NoFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NoFeedView()
    }
}
