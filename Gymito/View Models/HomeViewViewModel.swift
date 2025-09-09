//
//  HomeViewViewModel.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import FirebaseAuth
import Foundation

class HomeViewViewModel : ObservableObject{
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
    
    func getTodaysDate() -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        selectedDate = dateFormat.string(from: Date())
        return selectedDate
    }
    
    
    
}
