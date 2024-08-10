//
//  SwiftUIView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-29.
//

import SwiftUI

struct MovieFavoriteButtonView: View {
    @Environment(ModelData.self) var modelData
    @State var isSetFavorited: Bool
    @State var movie: Movie

    var body: some View {
        Button {
            isSetFavorited.toggle()
            movie.isFavorite = isSetFavorited
          
            for i in 0..<modelData.movieSearchResults.count {
                if modelData.movieSearchResults[i].id == movie.id {
                    modelData.movieSearchResults[i].isFavorite = isSetFavorited
                    break
                }
            }
            
            var isFound: Bool = false
            for n in 0..<ModelData().currentUserMovies.count {
                
                if modelData.currentUserMovies[n].id == movie.id {
                    isFound = true
                    if !isSetFavorited
                    {
                        modelData.currentUserMovies.remove(at: n)
                    }
                    break
                }
            }
            
            if !isFound && isSetFavorited {
                modelData.currentUserMovies.append(movie)
            }
        } label: {
            Label("Toggle Favorite", systemImage: isSetFavorited ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSetFavorited ? .red : .gray)
        }
    }
}

#Preview {
    MovieFavoriteButtonView(isSetFavorited: true, movie: Movie.sampleData[0])
        .environment(ModelData())
}
