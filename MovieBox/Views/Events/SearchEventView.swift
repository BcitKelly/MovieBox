//
//  SearchEventView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-29.
//

import SwiftUI

struct SearchEventView: View {
    @Environment(ModelData.self) var modelData
    //@StateObject var viewModel: SearchEventViewModel
    @State private var willShowResult = false
    @State var filteredEvents: [Event] = []
    @State var events: [Event] = []
    
    @StateObject var viewModel = SearchEventViewModel()
    
    var categories = ["All", "MovieNight", "MeetUp"]

    @State var selectedCategory = "All"

var cities = ["All", "Burnaby", "Vancouver", "Richmond"]
    
    @State var selectedCity = "All"
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Search Events")
                    .font(.headline)
                
                VStack (alignment: .trailing, spacing: 10) {
                    List {
                        Picker("Category", selection: $selectedCategory) {
                            ForEach(categories, id: \.self) { category in
                                Text(category).tag(category)
                            }
                        }.padding(.all, 5)
                            .listRowInsets(.init())
                            .listRowSeparator(.hidden)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.secondary, lineWidth: 1))
                    }
                    .listStyle(.plain)
                    .frame(height: 50, alignment: .leading)
                    .scrollContentBackground(.hidden)
                    
                    List {
                        Picker("City", selection: $selectedCity) {
                            ForEach(cities, id: \.self) { city in
                                Text(city).tag(city)
                            }
                        }.padding(.all, 5)
                            .listRowInsets(.init())
                            .listRowSeparator(.hidden)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.secondary, lineWidth: 1))
                    }
                    .listStyle(.plain)
                    .frame(height: 50, alignment: .leading)
                    .scrollContentBackground(.hidden)
                }
                
                ButtonView(title: "Search", action: {
                    viewModel.filterEvents(selectedCategory: selectedCategory, selectedCity: selectedCity)
                    willShowResult = true
                })
                
                ScrollView {
                    if viewModel.filteredEvents.count > 0 {
                        ForEach(viewModel.filteredEvents) { event in
                            NavigationLink {
                                EventDetailView(event: event)
                            } label: {
                                EventRowView(event: event)
                            }
                        }
                    } else {
                        Text("No Event found.")
                    }
                }
                //.padding(.horizontal)
            }
            .padding()
        }
    }
}

struct SearchEventView_Previews: PreviewProvider {
    static var previews: some View {
        SearchEventView()
            .environment(ModelData())
    }
}
