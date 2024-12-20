//
//  FinishWorkoutVIewViewModel.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-19.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class FinishWorkoutViewViewModel: ObservableObject {
    @Published var finalthoughts = ""
    
    
    func save(){
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        
        //set user currentlyworkingout to false
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId).setData(["currentlyWorkingOut": false], merge: true)
        
        
        //update the user finalNotes
        //get workoutId
        let viewModel = ProfileViewViewModel.shared
        viewModel.getUser()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Wait briefly
            guard let user = viewModel.user else {
                print("User data not loaded yet")
                return
            }
                db.collection("users")
                    .document(uId)
                    .collection("workouts")
                    .document(user.workoutId)
                    .setData(["finalNotes": self.finalthoughts], merge: true)
            }
        }
    }
