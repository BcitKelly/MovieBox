//
//  Event.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-23.
//

import Foundation
import CoreLocation

//struct userEvent: Codable {
//    var userId: Int
//    var events: [Event]
//}


struct UserEvent: Codable {
    let userId: String
    let eventId: Int
//    var title: String
//    var date: String
//    var time: String
//    var city: String
//    var isFavorite: Bool
    var isRegistered: Bool
    
//    mutating func setFavorite(_ state: Bool) {
//        isFavorite = state
//    }
    
    mutating func setRegistered(_ state: Bool) {
        isRegistered = state
    }
}

struct Event: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var date: String
    var time: String
    var address: String
    var city: String
    var imageName: String
    var description: String
    var isFavorite: Bool = false
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case movieNight = "MovieNight"
        case meetUp = "MeetUp"
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double = 0.0
        var longitude: Double = 0.0
    }
    
    var isRegistered: Bool = false
    
    mutating func setFavorite(_ state: Bool) {
        isFavorite = state
    }
    
    mutating func setRegistered(_ state: Bool) {
        isRegistered = state
    }
}



extension Event {
    static let EventList: [Event] = [
        Event(id: 1, title: "Movie Fans Club Meetup", date: "Auguet 12, 2024", time: "06:00PM", address: "123 Water Street", city: "Vancouver", imageName: "movieClub", description: "", isFavorite: false, category: .meetUp, coordinates: .init(latitude: 34.011_284, longitude: -116.166_860), isRegistered: false),
        Event(id: 2, title: "Movie Night at QE Park", date: "Auguet 12, 2024", time: "06:00PM", address: "456 Cambie Street", city: "Vancouver", imageName: "movieNight", description: "", isFavorite: false, category: .movieNight, coordinates: .init(latitude: 34.011_284, longitude: -116.166_860), isRegistered: false),
    ]
}
