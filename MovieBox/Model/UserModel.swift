//
//  User.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-28.
//

import Foundation
import CoreLocation

struct User: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var email: String
    var city: String
   // var password: String
   // var isLogined: Bool = false
}


//struct User: Codable {
//    let name: String
//    let id: String
//    let email: String
//    let joined: TimeInterval
//}
