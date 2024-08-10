//
//  ListSectionHeaderView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-08-04.
//

import SwiftUI

struct ListSectionHeaderView: View {
  
  @State var title: String
  @State var isOn: Bool
  @State var onLabel: String
  @State var offLabel: String
  
  var body: some View {
    Button(action: {
      withAnimation {
        isOn.toggle()
      }
    }, label: {
      if isOn {
        Text(onLabel)
      } else {
        Text(offLabel)
      }
    })
    .font(Font.caption)
    .foregroundColor(.accentColor)
    .frame(maxWidth: .infinity, alignment: .trailing)
    .overlay(
      Text(title),
      alignment: .leading
    )
  }
}

#Preview {
    ListSectionHeaderView(
        title: "Section 1",
        isOn: true,
        onLabel: "Hide",
        offLabel: "Show"
      )
}
