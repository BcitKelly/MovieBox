//
//  File.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-23.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: Int
    let name: String
    let city: String
    let imageName: String
   // let pupularMovies: [Movie]
}

extension Friend {
    static let sampleData: [Friend] = [
        Friend(id: 1, name: "Jimmy Smith", city: "Vancouver", imageName: "man"),
        Friend(id: 2, name: "Jane White", city: "Burnaby", imageName: "woman"),
    ]
}
