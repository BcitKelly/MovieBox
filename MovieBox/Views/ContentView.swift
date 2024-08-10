//
//  ContentView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-19.
//

import SwiftUI

struct ContentView: View {
   // @Environment(ModelData.self) var modelData
    @StateObject var viewModel = ContentViewModel()
    @State private var selection: Tab = .home
   // @State var isLogined: Bool = false

    init() {
//        UITabBar.appearance().unselectedItemTintColor = UIColor.white
//            UITabBar.appearance().backgroundColor = UIColor.black
    //        UITabBar.appearance().backgroundImage = UIImage()
        }
    
    enum Tab {
        case home
        case profile
        case searchMovie
        case searchEvent
    }

    var body: some View {
        if viewModel.isLogined, !viewModel.currenUserId.isEmpty {
            
            TabView(selection: $selection) {
                DashboardView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .tag(Tab.home)
                UserProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .tag(Tab.profile)
                SearchMovieView()
                    .tabItem {
                        Label("Search Movie", systemImage: "magnifyingglass")
                    }
                    .tag(Tab.searchMovie)
                SearchEventView()
                    .tabItem {
                        Label("Search Event", systemImage: "magnifyingglass")
                    }
                    .tag(Tab.searchEvent)
            }
            .font(.headline)
            .accentColor(.orange)
        } else {
            WelcomeView()
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          //  .environment(ModelData())
    }
}

