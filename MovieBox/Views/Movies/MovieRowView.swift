//
//  MovieListView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-23.
//

import Foundation
import SwiftUI

struct MovieRowView: View {
    let movie: Movie

//    var formattedDate: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter.dateFormat = "MMM dd yyy"
//        let dateStr = dateFormatter.date(from: movie.releaseDate )!
//        dateFormatter.dateFormat = "MMM d, yyyy"
//        return dateFormatter.string(from: dateStr)
//    }
    
    var body: some View {
        HStack {
            MovieImageView(movie: movie, size: 80)
                
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title )
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 18))
                    .bold()

                Text(movie.releaseDate)
                    .foregroundColor(Color.gray)
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie.sampleData[0])
        MovieRowView(movie: Movie.sampleData[1])
    }
}
