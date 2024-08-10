//
//  ContentViewModel.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-28.
//

import FirebaseAuth
import Firebase
import Foundation

class ContentViewModel: ObservableObject {
    @Published var currenUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currenUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isLogined: Bool {
        return Auth.auth().currentUser != nil
    }
    
    public var userId: String  {
        if Auth.auth().currentUser != nil {
            currenUserId = Auth.auth().currentUser?.uid ?? ""
            print(currenUserId)
            return Auth.auth().currentUser?.uid ?? ""
        }
        else {
            return ""
        }
    }
}


