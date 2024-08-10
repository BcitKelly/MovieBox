//
//  EventRowView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-23.
//

import SwiftUI

struct EventRowView: View {
    @Environment(ModelData.self) var modelData
    //@StateObject var viewModel = EventRowViewModel()
    @State var event: Event
    @State var isFavorite: Bool = false
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                RectangleImageView(imageName: event.imageName, size: 80)
                    .shadow(
                        color: Color.gray.opacity(0.6),
                        radius: 5,
                        x: 0,
                        y: 0)
                
                VStack(alignment: .leading) {
                    Text(event.title )
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 13))
                        .bold()
                    
                    Text(event.city)
                        .foregroundColor(Color.gray)
                        .font(.subheadline)
                        //.fontWeight(.bold)
                    
                    Text(event.date)
                        .foregroundColor(Color.gray)
                        .font(.subheadline)
                    
//                    Button {
//                        toggleIsFavorite(event: event)
//                    } label: {
 //                       EventFavoriteButtonView(isSetFavorited: event.isFavorite)
                    //}
                    
                    EventFavoriteButtonView(isSetFavorited: event.isFavorite, event: event)
                }
            }
            //Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
    
//    func toggleIsFavorite(event: Event) {
//        var isSetFavorited = !isFavorite
//        for i in 0..<modelData.eventSearchResults.count {
//            if modelData.eventSearchResults[i].id == event.id {
//                modelData.eventSearchResults[i].isFavorite = !isFavorite
//                break
//            }
//        }
//        
//        var isFound: Bool = false
//        for n in 0..<modelData.currentUserEvents.count {
//            
//            if modelData.currentUserEvents[n].id == event.id {
//                isFound = true
//                if !isSetFavorited
//                {
//                    modelData.currentUserEvents.remove(at: n)
//                }
//                break
//            }
//        }
//        
//        if !isFound && isSetFavorited {
//            modelData.currentUserEvents.append(event)
//        }
//    }
}

struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        //let modelData = ModelData()
        EventRowView(event: Event.EventList[0])
        EventRowView(event: Event.EventList[1])
            //.environment(modelData)
    }
}
