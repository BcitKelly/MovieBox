//
//  LoginViewModel.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-28.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
    }
    
    func login() {
        guard validate() else { return }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
//        for u in ModelData().users {
//            if u.email == email && u.password == password {
//                user = u
//                user?.isLogined = true
//                return
//            }
//        }
        
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid e-mail!"
            return false
        }
        
        return true
    }
}
