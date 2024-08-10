//
//  WelcomeView.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-20.
//

import SwiftUI

struct WelcomeView: View {
    let background = Image("bg")
    let logo = Image("movieboxLogo")
    @State var isActive: Bool = false
    
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
                    
                    VStack (spacing: 10){
                        InstructionPageView(pages: Instruction.instructionData.map { InstructionCardView(instruction: $0) })
                            .listRowInsets(EdgeInsets())
                        
                        
                        NavigationLink(destination: LoginView(), isActive: $isActive) {
                            
                            ButtonView(title: "Go to Login", action: {
                                isActive = true
                            })
                        }
                        
                        //                    Text("Welcome to the App")
                        //                        .font(.title)
                        //                    Text("You can use the App to search movie or events, and add to your collection. You can then manage your collection, add reviews, plan time to watch movies.")
                    }
                    .padding()
                    
                }
                .frame(minWidth: 0, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(.bottom, 50)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
