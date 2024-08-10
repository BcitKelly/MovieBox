//
//  LoginView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-20.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
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
                    
                    VStack (spacing: 20) {
                        TextField(
                            "Email",
                            text: $viewModel.email
                        )
                        .disableAutocorrection(true)
                        .padding(.all, 10)
                        .background(.white.opacity(0.8))
                        .cornerRadius(10)
                        //.textFieldStyle(.roundedBorder)
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
                        
                        ButtonView(title: "Login", action: {viewModel.login()})
                    }
                    .padding()
                    
                    
                    VStack {
                        Text("Don't have an Account?")
                        NavigationLink("Sign up", destination: SignupView())
                            .foregroundColor(.orange)
                            .fontWeight(.bold)
                    }
                    .padding(.bottom, 100)
                }
            }
            .frame(minWidth: 0, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
