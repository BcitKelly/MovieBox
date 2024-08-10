//
//  ModelData.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-29.
//

import FirebaseAuth
import Firebase
import Foundation

@Observable
class ModelData {
    var events: [Event] = []
    var movies: [Movie] = []
    var userEvents: [UserEvent] = []
    var userMovies: [UserMovie] = []
    var currentUserEvents: [Event] = []
    var currentUserMovies: [Movie] = []
    var currentUserId: String = ""
    var movieSearchResults: [Movie] = []
    var eventSearchResults: [Event] = []
    
    
    init()  {
        fetchData()
    }
    
//    func setCurrentUserId(){
//        guard let userId = Auth.auth().currentUser?.uid else {
//            return
//        }
//        currentUserId = userId
//    }
    
    func fetchData() {
        DispatchQueue.global(qos: .background).async {
            self.events = self.loadData("eventData.json")
        }
        
        DispatchQueue.global(qos: .background).async {
            self.userEvents = self.loadData("userEventData.json")
        }
        
        
        DispatchQueue.global(qos: .background).async {
            self.movies = self.loadData("movieData.json")
        }
        
        DispatchQueue.global(qos: .background).async {
            self.userMovies = self.loadData("userMovieData.json")
        }
    }
    
    func loadData<T: Decodable>(_ fileName: String) ->  T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
        else {
            fatalError("Couldn't find \(fileName).")
        }
        
        do {
                data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(fileName):\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            let uData = try decoder.decode(T.self, from: data)
            return uData
        } catch {
            fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
        }
    }
    
    func getUserEvents() {
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            return
        }
        var filteredUserEvents: [UserEvent] = []
        if !currentUserId.isEmpty {
            filteredUserEvents = userEvents.filter { $0.userId == currentUserId }
        }
        
        for userEvent in filteredUserEvents {
            for i in 0..<events.count {
                if events[i].id == userEvent.eventId {
                    events[i].isFavorite = true
                    events[i].isRegistered = userEvent.isRegistered
                    currentUserEvents.append(events[i])
                }
            }
        }
    }
    
    func getUserMovies()  {
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            return
        }
    
        var filteredUserMovies: [UserMovie] = []
        if !currentUserId.isEmpty {
            filteredUserMovies = userMovies.filter { $0.userId == currentUserId }
        }
        
        for userMovie in filteredUserMovies {
            for i in 0..<movies.count {
                if movies[i].id == userMovie.movieId {
                    movies[i].isFavorite = true
                    //movies[i].status = userMovie.status
                     currentUserMovies.append(movies[i])
                }
            }
        }
    }
    
    func searchMovies(selectedCategory: String, selectedGenre: Int, title: String) {
        
        var urlString: String = ""
        
        switch selectedCategory {
        case "Popular":
            urlString = "\(Constants.moviePopularUrl)"
            break
        case "Top Rated":
            urlString = "\(Constants.movieTopRatedUrl)"
            break
        default:
            urlString = "\(Constants.movieAllUrl)"
        }
        
        print(urlString)
        
        if selectedGenre != 0 {
            urlString += "&with_genres=\(String(selectedGenre))"
        }
        
        print(urlString)
        
        let trimedTitle = title.trimmingCharacters(in: .whitespaces)
        if !trimedTitle.isEmpty {
            urlString += "&query=\(trimedTitle)"
        }
        
        print(urlString)
        
        guard let url = URL(string: urlString)
        else {
            print("The movie URL is Invalid ")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
             
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) {

                        DispatchQueue.main.async {

                            self.movieSearchResults = decodedResponse.results
                            print(self.movieSearchResults)
                        }
                        return
                    }
                }

                print("Fetch failed.")
            }.resume()
    }
    
//    func saveToFile (_ fileName: String, _ MBData: Any) {
//        do {
//            let fileUrl = try FileManager.default
//                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                .appendingPathComponent(fileName)
//                .appendingPathExtension("json")
//            print("Writing data to: \(fileUrl)")
//            
//            let encoder = JSONEncoder()
//            encoder.outputFormatting = .prettyPrinted
//
//            let data = try encoder.encode(MBData)
//            //let data = try MBData.createDictionary()
//            try data.write(to: fileUrl)
//        } catch {
//            fatalError("Error saving data to File: \(error)")
//        }
//    }
//    
//    func createJsonData() -> Data {
//        let encoder = JSONEncoder()
//        encoder.outputFormatting = .prettyPrinted
//        
//        do {
//            return try? encoder.encode(self)
//        }  catch {
//            fatalError("Error creating json data: \(error)")
//        }
//    }
//    
//    func readJSON<T: Decodable>(_ fileName: String) -> T {
//        let data: Data
//        var fileUrl: URL
//        
//        do {
//            fileUrl = try FileManager.default
//                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                .appendingPathComponent(fileName)
//                .appendingPathExtension("json")
//        }
//        catch {
//                fatalError("Couldn't find \(fileName).")
//        }
//            
//        print("Reading data from: \(fileUrl)")
//        
//        do {
//            data = try Data(contentsOf: fileUrl)
//        } catch {
//            fatalError("Couldn't load \(fileName):\n\(error)")
//        }
//        
//        do {
//            let decoder = JSONDecoder()
//            return try decoder.decode(T.self, from: data)
//        } catch {
//            fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
//        }
//    }
}

