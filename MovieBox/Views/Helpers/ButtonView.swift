//
//  MBButton.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-28.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label : {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange)
                    //.padding(.all, 15)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                
                Text(title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.all, 15)
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Title", action: {})
    }
}

