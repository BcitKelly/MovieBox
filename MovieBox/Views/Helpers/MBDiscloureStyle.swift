//
//  MBDiscloureStyle.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-08-04.
//

import Foundation
import SwiftUI

struct MBDisclosureStyle: DisclosureGroupStyle {
    @Binding var isChosen: Bool
    func makeBody(configuration: Configuration) -> some View {
        Button {
            withAnimation {
                configuration.isExpanded.toggle()
            }
        } label: {
            HStack(alignment: .firstTextBaseline) {
                Button("Test", action: {
                    isChosen.toggle()
                })
                configuration.label
                Spacer()
                Text(configuration.isExpanded ? "Hide" : "Show")
                    .foregroundColor(.accentColor)
                    .font(.caption.lowercaseSmallCaps())
                    .animation(nil, value: configuration.isExpanded)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        if configuration.isExpanded {
            configuration.content
        }
    }
}
