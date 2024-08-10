//
//  SignupViewModel.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-29.
//


import FirebaseAuth
import FirebaseFirestore
import Foundation

class SignupViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var city = ""
    @Published var password = ""
    
    init() { }
    
    func signup() {
        guard validate() else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            self?.createUserRecord(id: userId)
        }
    }
    
    private func createUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, city: city)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.createDictionary())
    }
    
    private func validate() -> Bool {
        //errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            //errorMessage = "Please fill in all fields!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            //errorMessage = "Please enter valid e-mail!"
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}

