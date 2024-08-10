//
//  SignupView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-20.
//

import SwiftUI

struct SignupView: View {
    @StateObject var viewModel = SignupViewModel()
    @State var name = ""
    @State var email = ""
    @State var password = ""
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
                    
                    VStack (spacing: 15) {
                        TextField(
                            "Name",
                            text: $viewModel.name
                        )
                        .disableAutocorrection(true)
                        // .textFieldStyle(.roundedBorder)
                        .padding(.all, 10)
                        .background(.white.opacity(0.8))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.secondary, lineWidth: 1))
                        
                        TextField(
                            "Email",
                            text: $viewModel.email
                        )
                        .disableAutocorrection(true)
                        // .textFieldStyle(.roundedBorder)
                        .padding(.all, 10)
                        .background(.white.opacity(0.8))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.secondary, lineWidth: 1))
                        
                        TextField(
                            "City",
                            text: $viewModel.city
                        )
                        .disableAutocorrection(true)
                        // .textFieldStyle(.roundedBorder)
                        .padding(.all, 10)
                        .background(.white.opacity(0.8))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.secondary, lineWidth: 1))
                        
                        SecureField(
                            "Password",
                            text: $viewModel.password
                        )
                        .disableAutocorrection(true)
                        .padding(.all, 10)
                        .background(.white.opacity(0.8))
                        .cornerRadius(10)
                        //.textFieldStyle(.roundedBorder)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.secondary, lineWidth: 1))
                        
                        ButtonView(title: "Signup", action: {viewModel.signup()})
                            .padding(.bottom, 60)
                    }
                    .padding()
                }
                .frame(minWidth: 0, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
