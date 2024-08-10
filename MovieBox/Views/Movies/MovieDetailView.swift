//
//  MovieDetailView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-23.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(ModelData.self) var modelData
    @StateObject var viewModel = MovieDetailViewModel()
    //@Environment(SearchEventViewModel.self) var searchModelData
    var movie: Movie
    var movieId: Int = 0
    @State var videoResults: [Video] = []
    @State var movieResults: [Movie] = []
    var from: String = "SearchMovie"
    
//    var movieIndex: Int
//    {
//        if from == "SearchMovie" {
//            modelData.movieSearchResults.firstIndex(where: { $0.id == movieId})!
//        }    else {
//            modelData.currentUserMovies.firstIndex(where: { $0.id == movieId })!
//        }
//    }
    
//    var eventIndex: Int {
//        modelData.movieSearchResults.firstIndex(where: { $0.id == movie.id })!
//    }
    
    var body: some View {
        //@Bindable var modelData = modelData
        
        NavigationView {
            VStack {
                
                MovieImageView(movie: movie, size: 200)
                
                HStack {
                    Text(movie.title )
                        .multilineTextAlignment(.leading)
                        .font(.title)
                   // if from == "SearchMovie" {
                        MovieFavoriteButtonView(isSetFavorited:  movie.isFavorite, movie: movie)
//                    } else {
//                        MovieFavoriteButtonView(isSetFavorited:  movie.isFavorite, movie: movie)
//                    }
                }
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Overview:")
                        .font(.headline)
                    
                    Text(movie.overview )
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 15))
                    
                    HStack {
                        Text("Release Date: ")
                            .font(.headline)
                        
                        Text(movie.releaseDate )
                            .font(.system(size: 15))
                    }
                    .padding(.top, 10)
                    
                    Text("Trailer:")
                        .font(.headline)
                        .padding(.top, 10)
                    
                    ScrollView {
                        if viewModel.videoResults.count > 0 {
                            ForEach(viewModel.videoResults) { video in
                                NavigationLink {
                                    VideoPlayerView(videoKey: video.videoKey)
                                } label: {
                                    VideoRowView(video: video)
                                }
                            }
                        } else {
                            Text("No Trailer found.")
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .onAppear() {
                    viewModel.fetchVideo(movieId: movieId)
                }
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        MovieDetailView(movie: Movie.sampleData[0], movieId: 297762, from: "SearchMovie")
            .environment(modelData)
    }
}

