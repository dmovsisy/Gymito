//
//  NewWorkoutViewViewModel.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-19.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation


class NewWorkoutViewViewModel: ObservableObject {
    static let shared = NewWorkoutViewViewModel() 
    @Published var title = ""
    @Published var workoutDate = Date()
    @Published var userId = Auth.auth().currentUser?.uid
    @Published var workoutId = ""
    init(){
        
    }
    func save(){
        guard canSave else {
            return
        }
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create Model
        let newId = UUID().uuidString
        let newWorkout = Workout(
            id: newId,
            title: title,
            createdDate: workoutDate.timeIntervalSince1970,
            exercises: [],
            finalNotes: "",
            isCurrent: true)
        
        // Save Model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("workouts")
            .document(newId)
            .setData(newWorkout.asDictionary())
        
        db.collection("users")
            .document(uId).setData(["workoutId": newId], merge: true)
        
        workoutId = newId
        
        db.collection("users")
            .document(uId).setData(["currentlyWorkingOut": true], merge: true)
            
        
    }
    var canSave: Bool {
        guard title != "" else {
            return false
        }
        return true
    }
    
}
