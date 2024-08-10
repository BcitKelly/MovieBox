//
//  UserProfileView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-29.
//

import SwiftUI

struct UserProfileView: View {
    @StateObject var viewModel = UserProfileViewModel()
    let background = Image("bg")
    let logo = Image("movieboxLogo")
        
    var body: some View {
        NavigationView {
            ZStack {
                background
                    .resizable()
                    .opacity(0.5)
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(minWidth: 0, maxWidth: .infinity)
                VStack {
                    VStack (spacing: 5){
                        logo
                            .resizable()
                            .frame(width: 120, height: 120)
                            .padding(.top, 20)
                        Text("Movie Box")
                            .font(.system(size: 28))
                            .bold()
                            .padding(.top, 5)
                    }
                    
                    Spacer()
                    
                    if let user = viewModel.user {
                        VStack (spacing: 20){
                            Image(systemName: "person.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.black)
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack (alignment: .leading) {
                                HStack {
                                    Text("Name: ")
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    
                                    Text(user.name)
                                }
                                
                                HStack {
                                    Text("City:")
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    Text(user.city)
                                }
                            }
                            ButtonView(title: "Logout", action: {viewModel.logout()})
                        }
                       // .navigationTitle("Profile")
                        .padding(.bottom, 150)
                    } else {
                        VStack {
                            Text("retrieving your profile...")
                            .padding(.bottom, 150)
                        }
                    }
                        
                }
                .padding()
                .onAppear {
                    viewModel.fetchUser()
                }
            }
            .frame(minWidth: 0, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
       
        }
            
//            @ViewBuilder
//            func profile(user: User) -> some View {
//                HStack{ }
//            }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
