//
//  EventDetailView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-29.
//

import SwiftUI

struct EventDetailView: View {
    @Environment(ModelData.self) var modelData
   // @EnvironmentObject var searchEventModel: SearchEventViewModel
    let event: Event

//    var eventIndex: Int {
//        searchEventModel.filteredEvents.firstIndex(where: { $0.id == event.id })!
//    }

//    var title: String
//    var date: String
//    var time: String
//    var address: String
//    var city: String
//    var imageName: String
//    var description: String
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: event.locationCoordinate)
                .frame(height: 300)

            RoundImageView(imageName: event.imageName, size: 120)
                .offset(y: -80)
                .padding(.bottom, -80)

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(event.title)
                        .font(.title2)
                    EventFavoriteButtonView(isSetFavorited: event.isFavorite, event: event)
                }

                HStack {
                    Text(event.date)
                    Spacer()
                    Text(event.time)
                }
                .font(.subheadline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.secondary)

                Divider()

                HStack {
                    Text(event.address)
                    Spacer()
                    Text(event.city)
                }
                .font(.subheadline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.secondary)
                
                Text("")
                Text(event.description)
            }
            .padding()
        }
       // .navigationTitle(event.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        EventDetailView(event: Event.EventList[0])
            .environment(modelData)
    }
}
