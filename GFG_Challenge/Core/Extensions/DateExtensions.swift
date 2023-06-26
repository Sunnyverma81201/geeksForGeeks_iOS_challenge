//
//  DateExtensions.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 26/06/23.
//

import Foundation

extension DateFormatter {
    static let jsonDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    static let presentableDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter
    }()
    
    static let presentableTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = " hh:mm a"
        return formatter
    }()
}
