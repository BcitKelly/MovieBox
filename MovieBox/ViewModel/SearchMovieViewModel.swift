//
//  SearchMovieViewModel.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-22.
//

import Foundation
import Network

class SearchMovieViewModel: ObservableObject {
    @Published var movieSearchResults: [Movie] = []
//    @Published var selectedCategory: String = "All"
//    @Published var selectedGenre: Int = 0
//    @Published var title = ""
    //@Published var searchQuery: String = ""
    //@Published var page = 1
    
    func fetchMovie(selectedCategory: String, selectedGenre: Int, title: String)  {
//        DispatchQueue.main.async {
//            ModelData().searchMovies(selectedCategory: selectedCategory, selectedGenre: selectedGenre, title: title)
//        }
        ModelData().movieSearchResults = []
        
        var urlString: String = ""
        
        switch selectedCategory {
        case "Popular":
            urlString = "\(Constants.moviePopularUrl)"
            break
        case "Top Rated":
            urlString = "\(Constants.movieTopRatedUrl)"
            break
        default:
            urlString = "\(Constants.movieAllUrl)"
        }
        
        print(urlString)
        
        if selectedGenre != 0 {
            urlString += "&with_genres=\(String(selectedGenre))"
        }
        
        print(urlString)
        
        let trimedTitle = title.trimmingCharacters(in: .whitespaces)
        if !trimedTitle.isEmpty {
            urlString += "&query=\(trimedTitle)"
        }
        
        print(urlString)
        
        guard let url = URL(string: urlString)
        else {
            print("The movie URL is Invalid ")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
             
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) {

                        DispatchQueue.main.async {

                            self.movieSearchResults = decodedResponse.results
                            print(self.movieSearchResults)
                        }
                        ModelData().movieSearchResults = self.movieSearchResults
                        return
                    }
                }

                print("Fetch failed.")
            }.resume()
    }
}

