//
//  SearchMoviesView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-22.
//

import SwiftUI

struct SearchMoviesView: View {
   // @StateObject var movieViewModel = SearchMovieViewModel()
  //  @State private var searchQuery = ""
    
    var body: some View {
//        NavigationView {
//            List {
//                ForEach(movieViewModel.searchMovieResults, id: \.id) { movie in
//                    NavigationLink {
//                        MovieDetailView(movie: movie)
//                    } label: {
//                        MovieRowView(movie: movie)
//                    }
//                }
//            }
//            .searchable(text: $searchQuery)
//            .navigationTitle("Search Movies")
//            .onSubmit(of: .search) {
//                Task {
//                    await movieViewModel.fetchMovie(searchQuery: searchQuery)
//                    searchQuery = ""
//                }
//            }
//        }
//        .accentColor(.yellow)
        Text("")
    }
}

struct SearchMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMoviesView()
    }
}
