//
//  MovieViewModel.swift
//  NetworkingTask
//
//  Created by Anna Sumire on 17.11.23.
//

import UIKit

final class MovieListViewModel {
    private var movies: [Movie]
    
    init(movies: [Movie]) {
        self.movies = movies
    }
}

extension MovieListViewModel {
    var numberOfSections: Int {
        1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        movies.count
    }
    
    func movieAtIndex(_ index: Int) -> MovieViewModel {
        let movie = self.movies[index]
        return MovieViewModel(movie)
    }
    
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        MovieService.shared.fetchMovies { result in
            switch result {
            case .success(let movies):
                self.movies = movies
                completion(.success(movies))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

struct MovieViewModel {
    private let movie: Movie
}

extension MovieViewModel {
    init(_ movie: Movie) {
        self.movie = movie
    }
}

extension MovieViewModel {
    var title: String {
        movie.title
    }
    
    var posterPath: String {
        movie.posterPath
    }
}
