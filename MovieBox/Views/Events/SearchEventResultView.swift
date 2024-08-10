//
//  SearchEventResultView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-29.
//

import SwiftUI

struct SearchEventResultView: View {
    @State var searchEventResults: [Event] = []

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(searchEventResults) { event in
                    NavigationLink {
                        EventDetailView(event: event)
                    } label: {
                        EventRowView(event: event)
                    }
                }
            }
            .animation(.default, value: searchEventResults)
            .navigationTitle("Events")
        } detail: {
            Text("Select an Event")
        }
        
    }
}

struct SearchEventResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchEventResultView(searchEventResults: ModelData().events)
            .environment(ModelData())
    }
}
  
