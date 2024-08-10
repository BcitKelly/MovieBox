//
//  SearchEventViewModel.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-29.
//

import Foundation

final class SearchEventViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var filteredEvents: [Event] = []
   // @Published var selectedCategory: String = "All"
   // @Published var selectedCity: String = "All"
    
    init () {
        self.events = ModelData().loadData("eventData.json")
        filteredEvents = events
    }
    
    func filterEvents(selectedCategory: String, selectedCity: String) {
        if (selectedCategory != "All") && (selectedCity != "All") {
            filteredEvents =  self.events.filter { $0.city == selectedCity && $0.category.rawValue == selectedCategory }
        } else if (selectedCategory != "All") && (selectedCity == "All") {
            filteredEvents =  self.events.filter {$0.category.rawValue == selectedCategory }
        } else if (selectedCategory == "All") && (selectedCity != "All") {
            filteredEvents =  self.events.filter { $0.city == selectedCity}
        } else if (selectedCategory == "All") && (selectedCity == "All") {
            filteredEvents = events
        }
    }
}
