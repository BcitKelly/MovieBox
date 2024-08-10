//
//  VideoRowView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-08-08.
//

import SwiftUI

struct VideoRowView: View {
    let video: Video

    var body: some View {
        HStack {
            RectangleImageView(imageName: "youtube", size: 30)
            VStack(alignment: .leading, spacing: 5) {
                Text(video.name )
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.blue)
                    .font(.system(size: 14))
                    .bold()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct VideoRowView_Previews: PreviewProvider {
    static var previews: some View {
        VideoRowView(video: Video.sampleData[0])
        VideoRowView(video: Video.sampleData[1])
    }
}
