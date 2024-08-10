//
//  DashboardView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-23.
//

import SwiftUI

struct DashboardView: View {
    @Environment(ModelData.self) var modelData
    @StateObject var viewModel = DashboardViewModel()
    @State var userMovies: [Movie] = []
    @State var userEvents: [Event] = []
    @State var showMovie: Bool = true
    @State var showEvent: Bool = true
    
    var filteredMovies: [Movie] {
        modelData.currentUserMovies.filter { movie in
            (movie.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("My Favorite Collection")
                    .font(.title2)
                    .padding(.bottom, 10)
                
                
                VStack (alignment: .leading, spacing: 10) {
                    
                    DisclosureGroup("Movies", isExpanded: $showMovie) {
                    }
                    .padding(.horizontal)
                    .font(.title2)
                    .fontWeight(.bold)
                    .clipped()
                    //.accentColor(Color.orange)
                    .background(Gradient(colors: [.black, .gray]).opacity(0.2))
                    //.buttonStyle()
                    .tint(Color .black)
                    //.background(Color .primary)
                    .onTapGesture {
                        withAnimation {
                            showMovie.toggle()
                        }
                    }
                    
                    if showMovie {
                        List {
                            ForEach(modelData.currentUserMovies, id: \.id) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie, movieId: movie.id, from: "Dashboard")
                                } label: {
                                    MovieRowView(movie: movie)
                                }
                                
                            }
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                    }
                    
                    
                    DisclosureGroup("Events", isExpanded: $showEvent) {
                    }
                    .padding(.horizontal)
                    .font(.title2)
                    .fontWeight(.bold)
                    .clipped()
                    //.accentColor(Color.orange)
                    .background(Gradient(colors: [.black, .gray]).opacity(0.2))
                    //.buttonStyle()
                    .tint(Color .black)
                    .onTapGesture {
                        withAnimation {
                            showEvent.toggle()
                        }
                    }
                    
                    if showEvent {
                        List {
                            ForEach(modelData.currentUserEvents, id: \.id) { event in
                                NavigationLink {
                                    EventDetailView(event: event)
                                } label: {
                                    EventRowView(event: event)
                                }
                            }
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                    }
                }
            }
            .frame(minWidth: 0, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
        .onAppear() {
            modelData.getUserEvents()
            modelData.getUserMovies()
        }
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environment(ModelData())
        //DashboardView(movies: Movie.sampleData, friends: Friend.sampleData)
    }
}
