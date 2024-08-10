//
//  ImageView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-23.
//

import SwiftUI

struct RectangleImageView: View {
    let imageName: String
    let size: CGFloat
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: size)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(maxHeight: 300)
        }
    }
}

struct RectangleImageView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleImageView(imageName: "man", size: 150)
            .previewLayout(.sizeThatFits)
    }
}
