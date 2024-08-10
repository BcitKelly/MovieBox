//
//  CardView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-31.
//

import SwiftUI

struct CardView: View{
    var movie: Movie

    var body: some View {
        AsyncImage(url: URL(string: "\(Constants.imageBaseUrl)\(movie.posterPath)")) { image in
            image.resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                //.frame(maxHeight: 300)
                .shadow(
                    color: Color.gray.opacity(0.6),
                    radius: 5,
                    x: 0,
                    y: 0)
        } placeholder: {
            ProgressView()
        }
            .overlay {
                TextOverlay(movie: movie)
            }
    }
}

struct TextOverlay: View {
    var movie: Movie

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title)
                    .bold()
                Text(movie.releaseDate)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    CardView(movie: Movie.sampleData[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}
