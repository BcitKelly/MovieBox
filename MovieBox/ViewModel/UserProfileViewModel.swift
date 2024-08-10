//
//  UserProfileViewModel.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-29.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init () {
    }
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("No user")
            return
        }
    
        print(userId)
        
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).getDocument { snapshot, error in
            guard let data = snapshot?.data(), error  == nil else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.user = User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  city: data["city"] as? String ?? "")
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}

