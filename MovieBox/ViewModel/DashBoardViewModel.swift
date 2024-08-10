//
//  DashBoardViewModel.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-08-05.
//

import FirebaseAuth
import Firebase
import Foundation

final class DashboardViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var movies: [Movie] = []
    @Published var userEvents: [UserEvent] = []
    @Published var userMovies: [UserMovie] = []
    @Published var currentUserEvents: [Event] = []
    @Published var currentUserMovies: [Movie] = []
    @Published var currentUserId: String = ""

    init () {
//        guard let userId = Auth.auth().currentUser?.uid else {
//            print("No user")
//            return
//        }
//        currentUserId = userId
        
        //currentUserId = "mVLf7bmqvIad4lraPYZBc9hNQRM2"
        //getData()
        
    }
    
    func getData() {
//        DispatchQueue.global(qos: .background).async {
//            self.events = ModelData().loadData("eventData.json")
//        }
//    
//        DispatchQueue.global(qos: .background).async {
//            self.userEvents = ModelData().loadData("userEventData.json")
//        }
        
//        DispatchQueue.main.async {
//            self.getUserEvents()
//        }
        
//        DispatchQueue.global(qos: .background).async {
//            self.movies = ModelData().loadData("movieData.json")
//        }
//        
//        DispatchQueue.global(qos: .background).async {
//            self.userMovies = ModelData().loadData("userMovieData.json")
//        }
        
//        DispatchQueue.main.async {
//            self.getUserMovies()
//        }
        
    }
    
//    func getUserEvents() {
//        guard let currentUserId = Auth.auth().currentUser?.uid else {
//            return
//        }
//        var filteredUserEvents: [UserEvent] = []
//        if !currentUserId.isEmpty {
//            filteredUserEvents = userEvents.filter { $0.userId == currentUserId }
//        }
//        
//        for userEvent in filteredUserEvents {
//            for i in 0..<events.count {
//                if events[i].id == userEvent.eventId {
//                    events[i].isFavorite = true
//                    events[i].isRegistered = userEvent.isRegistered
//                    currentUserEvents.append(events[i])
//                }
//            }
//        }
//    }
//    
//    func getUserMovies()  {
//        var filteredUserMovies: [UserMovie] = []
//        if !currentUserId.isEmpty {
//            filteredUserMovies = userMovies.filter { $0.userId == currentUserId }
//        }
//        
//        for userMovie in filteredUserMovies {
//            for i in 0..<movies.count {
//                if movies[i].id == userMovie.movieId {
//                    movies[i].isFavorite = true
//                    movies[i].status = userMovie.status
//                     currentUserMovies.append(movies[i])
//                }
//            }
//        }
//    }
    
    
    func saveUserEventsToFile ()  {
        let fileName = "userEventsData.json"
        let MBData =  userEvents
        //ModelData().saveToFile(fileName, MBData)

        do {
            let fileUrl = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(fileName)
                .appendingPathExtension("json")
            print("Writing data to: \(fileUrl)")
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted

            let data = try encoder.encode(MBData)
            //let data = try MBData.createDictionary()
            try data.write(to: fileUrl)
        } catch {
            fatalError("Error saving data to File: \(error)")
        }
    }
    
    func saveUserMoviesToFile ()  {
        let fileName = "userMoviesData.json"
        let MBData = userMovies
        //ModelData().saveToFile(fileName, MBData)

        do {
            let fileUrl = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(fileName)
                .appendingPathExtension("json")
            print("Writing data to: \(fileUrl)")
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted

            let data = try encoder.encode(MBData)
            //let data = try MBData.createDictionary()
            try data.write(to: fileUrl)
        } catch {
            fatalError("Error saving data to File: \(error)")
        }
    }
    
}
