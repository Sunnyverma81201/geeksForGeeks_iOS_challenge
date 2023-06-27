//
//  ViewExtension.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 27/06/23.
//

import Foundation
import SwiftUI

extension View {
    /// Adds a formatted date and time view modifier to the view.
    ///
    /// - Parameters:
    ///   - date: The string representing the date.
    /// - Returns: A view with the formatted date and time.
    func getFormattedDateAndTime(_ date: String) -> some View {
        let dateObj = DateFormatter.jsonDateFormatter.date(from: date)
        
        let formattedDate = DateFormatter.presentableDateFormatter.string(from: dateObj ?? Date())
        let formattedTime = DateFormatter.presentableTimeFormatter.string(from: dateObj ?? Date())
        
        return self.modifier(FormattedDateAndTimeViewModifier(formattedDate: formattedDate, formattedTime: formattedTime))
    }
}

struct FormattedDateAndTimeViewModifier: ViewModifier {
    let formattedDate: String
    let formattedTime: String
    
    func body(content: Content) -> some View {
        // Create a view that displays the formatted date and time
        HStack(spacing: 8) {
            Text(formattedDate)
                .font(Font.custom("Poppins-Bold", size: 12))
            
            Text(formattedTime)
                .font(Font.custom("Poppins", size: 12))
        }
        .foregroundColor(.gray)
        // Overlay the original content on top of the formatted date and time view
        .overlay(content)
    }
}
