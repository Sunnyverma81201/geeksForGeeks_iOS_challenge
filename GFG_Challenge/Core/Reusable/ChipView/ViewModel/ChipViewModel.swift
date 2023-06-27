//
//  ChipViewModel.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 27/06/23.
//

import Foundation

class ChipViewModel: ObservableObject {
    //MARK: Variables
    var text: String
    
    //MARK: Initializer
    init(text: String) {
        self.text = text
    }
}
