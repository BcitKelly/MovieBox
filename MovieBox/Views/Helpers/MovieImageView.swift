//
//  ImageView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-23.
//

import SwiftUI

struct MovieImageView: View {
    let movie: Movie
    let size: CGFloat
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "\(Constants.imageBaseUrl)\(movie.posterPath)")) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: size)
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
         //   .frame(maxHeight: 300)
        }
    }
}

struct MovieImageView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageView(movie: Movie.sampleData.first!, size: 150)
            .previewLayout(.sizeThatFits)
    }
}
