//
//  MovieDetailViewModel.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-08-08.
//

import Foundation

import Network

class MovieDetailViewModel: ObservableObject {
    @Published var videoResults: [Video] = []
   // @Published var movieId: Int = 0
    
    
    func fetchVideo(movieId: Int)  {
        //var movieId: Int
        
        if movieId == 0  {
            return
        }
        
        var urlString: String = ""
        
        urlString = "\(Constants.movieVideoBaseUrl)\(movieId)\(Constants.movieVideoKeyUrl)"
        
        print(urlString)
        
        guard let url = URL(string: urlString)
        else {
            print("The URL is Invalid ")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode(VideoResponse.self, from: data) {

                        DispatchQueue.main.async {
                           self.videoResults = decodedResponse.results
                            print(self.videoResults)
                        }
                        return
                    }
                }

                print("Fetch failed.")
            }.resume()
    }
}
