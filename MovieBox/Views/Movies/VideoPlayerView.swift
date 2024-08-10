//
//  VideoPlayerView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-08-08.
//

import SwiftUI
import YouTubeiOSPlayerHelper

struct VideoPlayerView: View {
    var videoKey: String
    
    var body: some View {
        VStack {
            YouTubePlayerView(videoKey: videoKey) // Replace with your video ID
                    .frame(height: 300)
                    .cornerRadius(10)
                    .padding()
            }
    }
}

#Preview {
    VideoPlayerView(videoKey: "TX9qSaGXFyg")
}


