//
//  MovieModel.swift
//  NetworkingTask
//
//  Created by Anna Sumire on 11.11.23.
//

import Foundation

struct MovieModel: Decodable {
    var results: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let title: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
    }
}
