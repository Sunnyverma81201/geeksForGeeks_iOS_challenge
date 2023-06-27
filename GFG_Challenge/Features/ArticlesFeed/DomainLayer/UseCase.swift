//
//  UseCase.swift
//  GFG_Challenge
//
//  Created by Apoorv Verma on 26/06/23.
//

import Foundation

/// All the fetch operations must follow this protocol
protocol UseCase {
    func fetchArticles(completion: @escaping (Result<[Article], Error>) -> Void)
}
