//
//  EventFavoriteButtonView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-08-09.
//

import SwiftUI

struct EventFavoriteButtonView: View {
    @Environment(ModelData.self) var modelData
    @State var isSetFavorited: Bool
    @State var event: Event

    var body: some View {
        Button {
            isSetFavorited.toggle()
            event.isFavorite = isSetFavorited
            
            for i in 0..<modelData.eventSearchResults.count {
                if modelData.eventSearchResults[i].id == event.id {
                    modelData.eventSearchResults[i].isFavorite = isSetFavorited
                    break
                }
            }
            
            var isFound: Bool = false
            for n in 0..<ModelData().currentUserEvents.count {
                
                if modelData.currentUserEvents[n].id == event.id {
                    isFound = true
                    if !isSetFavorited
                    {
                        modelData.currentUserEvents.remove(at: n)
                    }
                    break
                }
            }
            
            if !isFound && isSetFavorited {
                modelData.currentUserEvents.append(event)
            }
        } label: {
            Label("Toggle Favorite", systemImage: isSetFavorited ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSetFavorited ? .red : .gray)
        }
    }
}

#Preview {
    EventFavoriteButtonView(isSetFavorited: true, event: Event.EventList[0])
        .environment(ModelData())
}
