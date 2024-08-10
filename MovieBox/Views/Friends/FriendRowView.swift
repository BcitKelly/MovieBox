//
//  FriendRowView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-23.
//

import SwiftUI

struct FriendRowView: View {
    let friend: Friend
    
    var body: some View {
        HStack (spacing: 20){
            RoundImageView(imageName: friend.imageName, size: 150)
                .shadow(
                    color: Color.gray.opacity(0.6),
                    radius: 5,
                    x: 0,
                    y: 0)
            VStack(alignment: .leading, spacing: 5) {
                Text(friend.name )
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 18))
                    .bold()

                Text(friend.city)
                    .foregroundColor(Color.gray)
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct FriendRowView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRowView(friend: Friend.sampleData.first!)
    }
}
