//
//  File.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-22.
//

import Foundation

struct UserMovie: Codable {
    var userId: String
    var movieId: Int
    var status: Status?
    var statusDate: String?
}

struct MovieResponse: Codable {
    let results: [Movie]
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct VideoResponse: Codable {
    let results: [Video]
    enum CodingKeys: String, CodingKey {
        case results
    }
}

enum Status: String, CaseIterable, Codable {
    case forLater = "ForLater"
    case scheduleToWatch = "ScheduleToWatch"
    case watched = "Watched"
}

struct Genre: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
}


struct Movie: Hashable, Codable, Identifiable {
    let id: Int
    let title: String
    let genreIds: [Int]
    let releaseDate: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let voteCount: Int
    let voteAverage: Double
    var isFavorite: Bool = false
    
//    var status: Status?
//    var statusDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case genreIds = "genre_ids"
        case releaseDate = "release_date"
        case overview
        case popularity
        case posterPath = "poster_path"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
//        case isFavorite
//        case status
//        case statusDate
    }
}

struct Video: Hashable, Codable, Identifiable {
    var id: String
    var videoType: String
    var site: String
    var name: String
    var videoKey: String
    var official: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case videoType = "type"
        case site
        case name
        case videoKey = "key"
        case official
    }
}

extension Genre {
    static let genres: [Genre] = [
        Genre(id: 0, name: "All"),
        Genre(id: 37, name: "Western"),
        Genre(id: 28, name: "Action"),
        Genre(id: 18, name: "Drama"),
        Genre(id: 14, name: "Fantasy"),
        Genre(id: 878, name: "Science Fiction"),
    ]
}

extension Movie {
    static let sampleData: [Movie] = [
        Movie(id: 297762,
              title: "Giant",
              genreIds: [18],
              releaseDate: "2023-03-01",
              overview: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler",
              popularity: 8.5,
              posterPath: "/74xTEgt7R36Fpooo50r9T25onhq.jpg",
              voteCount: 100,
              voteAverage: 7.5,
              isFavorite: false),
        Movie(id: 297762,
               title: "Super Man",
               genreIds: [18],
               releaseDate: "2023-03-01",
               overview: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler",
               popularity: 8.5,
               posterPath: "/74xTEgt7R36Fpooo50r9T25onhq.jpg",
               voteCount: 100,
               voteAverage: 7.5,
              isFavorite: true),
        Movie(id: 297762,
              title: "Happy Day",
              genreIds: [18],
              releaseDate: "2023-03-01",
              overview: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler",
              popularity: 8.5,
              posterPath: "/74xTEgt7R36Fpooo50r9T25onhq.jpg",
              voteCount: 100,
              voteAverage: 7.5,
              isFavorite: false),
    ]
}

extension Video {
    static let sampleData: [Video] = [
//        Video(id: "59b920219251417e52010f4b", name: "Official Final Trailer - Rise of the Warrior", videoKey: "VSB4wGIdDwo"),
//        Video(id: "58c5cb929251411d30005d71", name: "Official Origin Trailer", videoKey: "INLzqh7rZ-U"),
        
        Video(id: "59b920219251417e52010f4b", videoType: "Trailer", site: "YouTube", name: "Official Final Trailer - Rise of the Warrior", videoKey: "VSB4wGIdDwo", official: true),
        Video(id: "58c5cb929251411d30005d71", videoType: "Trailer", site: "YouTube", name: "Official Origin Trailer", videoKey: "INLzqh7rZ-U", official: true),
        
    ]
}
