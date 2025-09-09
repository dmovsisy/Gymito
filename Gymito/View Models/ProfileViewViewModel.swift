//
//  ProfileViewViewModel.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject {
    static let shared = ProfileViewViewModel()
    @Published var user: User? = nil
    
    func getUser(){
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument(){ [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "" ,
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    timeJoined: data["timeJoined"] as? TimeInterval ?? 0,
                    workoutId: data["workoutId"] as? String ?? "",
                    currentlyWorkingOut: data["currentlyWorkingOut"] as? Bool ?? false)
            }
        }
    }
 
    func signOut(){
        
        //Try to log in
        try? Auth.auth().signOut()
        
    }
    
}
