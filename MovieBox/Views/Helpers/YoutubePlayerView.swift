//
//  YoutubePlayerView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-08-08.
//

import SwiftUI
import YouTubeiOSPlayerHelper

struct YouTubePlayerView: UIViewRepresentable {
    var videoKey: String

    func makeUIView(context: Context) -> YTPlayerView {
        let playerView = YTPlayerView()
        playerView.load(withVideoId: videoKey, playerVars: ["playsinline": 1, "autoplay": 1, "rel": 0])
        return playerView
    }

    func updateUIView(_ uiView: YTPlayerView, context: Context) {
        
    }
}
