//
//  MovieModel.swift
//  NetworkingTask
//
//  Created by Anna Sumire on 11.11.23.
//

import Foundation

struct MovieModel: Decodable {
    let Search: [Movies]
}

struct Movies: Decodable {
    let Title: String
    let Year: String
    let Poster: String
    
    var imageURL: URL? {
        return URL(string: Poster)
    }
}
