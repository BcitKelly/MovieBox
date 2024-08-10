//
//  MovieBoxInstructionModel.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-08-05.
//

import Foundation


struct Instruction: Codable, Identifiable {
    let id: Int
    let detail: String
}

extension Instruction {
    static let instructionData: [Instruction] = [
        Instruction(id: 1, detail: "Movie Box is an App for entertainment fans worldwide. You can create your own watchlist or search entertainment events in your local area. You can also watch trailer with the App."),
        Instruction(id: 2, detail: "You can search popular or top rated movies all around the world in different language. You then personalized pick your favorite movie and add to your watchlist. You can schedule a date to watch, or mark it wateched. You can also add your review."),
        Instruction(id: 3, detail: "You can search events by city or by category. You then personalized pick you favorite event and add to your favorite event list. Find out what is fun in your city, and enjoy the activities.")
    ]
}
