//
//  ChipView.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 27/06/23.
//

import SwiftUI

struct ChipView: View {
    @StateObject var chipViewModel: ChipViewModel
    var body: some View {
        HStack(spacing: 4) {
            Text(chipViewModel.text)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.accentColor))
        }
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(chipViewModel: ChipViewModel(text: "Hello"))
    }
}
