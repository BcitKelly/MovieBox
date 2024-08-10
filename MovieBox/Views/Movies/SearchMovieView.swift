//
//  SearchMovieView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-23.
//

import SwiftUI

struct SearchMovieView: View {
    @Environment(ModelData.self) var modelData
    @StateObject var viewModel = SearchMovieViewModel()
    @State var movieSearchResults: [Movie] = []
    @State var showResults: Bool = false
    
    @State var title = ""
    
    var movieCategories = ["All", "Popular", "Top_Rated"]
    //"Now_Playing", "Upcoming",
    @State private var selectedCategory = "Popular"
  
    @State private var selectedGenre = Genre.genres[0].id
    
    var body: some View {
        NavigationView {
        VStack {
            Text("Search Movies")
                .font(.headline)
            
            VStack (spacing: 10){
                TextField(
                    "Movie Name",
                    text: $title
                ) .disableAutocorrection(true)
                // .textFieldStyle(.roundedBorder)
                    .padding(.all, 10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.secondary, lineWidth: 1))
                
                List {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(movieCategories, id: \.self) { category in
                            Text(category)
                        }
                    }
                    .listRowInsets(.init())
                    .listRowSeparator(.hidden)
                    .padding(.all, 5)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.secondary, lineWidth: 1))
                }
                .listStyle(.plain)
                //.environment(\.defaultMinListRowHeight, 0)
                .frame(height: 45, alignment: .leading)
                .scrollContentBackground(.hidden)
                
                List {
                    Picker("Genre", selection: $selectedGenre) {
                        ForEach(Genre.genres) { genre in
                            Text(genre.name).tag(genre.id)
                        }
                    }.padding(.all, 5)
                        .listRowInsets(.init())
                        .listRowSeparator(.hidden)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.secondary, lineWidth: 1))
                }
                .listStyle(.plain)
                .frame(height: 50, alignment: .leading)
                .scrollContentBackground(.hidden)
            }
            
            ButtonView(title: "Search") {
                viewModel.fetchMovie(selectedCategory: selectedCategory, selectedGenre: selectedGenre, title: title)
                showResults = true
            }
            
            //                viewModel.filterEvents(selectedCategory: selectedCategory, selectedCity: selectedCity)
            // SearchMovieResultView()
            
            
                ScrollView {
                    if showResults {
                        if viewModel.movieSearchResults.count > 0 {
                            ForEach(viewModel.movieSearchResults) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie, movieId: movie.id, from: "SearchMovie")
                                } label: {
                                    MovieRowView(movie: movie)
                                }
                            }
                        } else {
                            Text("No Movie found.")
                        }
                    }
                }
            }
            .frame(minWidth: 0, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .onAppear(){
                if modelData.movieSearchResults.count > 0 {
                    viewModel.movieSearchResults = modelData.movieSearchResults
                }
            }
        }
    }
}

struct SearchMovieView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMovieView()
            .environment(ModelData())
    }
}
