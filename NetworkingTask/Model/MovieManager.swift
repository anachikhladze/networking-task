//
//  MovieManager.swift
//  NetworkingTask
//
//  Created by Anna Sumire on 11.11.23.
//

import UIKit

struct MovieManager {
    func fetchMovies(completion: @escaping(MovieModel) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=2c249c0&s=action") else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error Fetching Movies: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(MovieModel.self, from: jsonData)
                completion(decodedData)
            } catch {
                print("Error decoding data")
            }
        }
        dataTask.resume()
    }
    
    func loadImage(from imageURL: URL?, into imageView: UIImageView) {
        guard let imageURL = imageURL else { return }
        URLSession.shared.dataTask(with: imageURL) { (data, _, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageView.image = image
                }
            } else {
                print("Failed to load image: \(error?.localizedDescription ?? "unknown error")")
            }
        }.resume()
    }
}
