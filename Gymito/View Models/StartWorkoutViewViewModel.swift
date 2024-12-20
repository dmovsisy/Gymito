//
//  WorkoutViewViewModel.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-19.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation


class StartWorkoutViewViewModel: ObservableObject{
    @Published var showWorkoutSheet = false
    @Published var showWorkoutFinishSheet = false
    @Published var userId = Auth.auth().currentUser?.uid
    
    func currentlyWorkingOut(){
        
    }
    
    
    func toggleisCurrent(item: Workout){
        var workoutCopy = item
        workoutCopy.setDone(!item.isCurrent)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("workout")
            .document(workoutCopy.id)
            .setData(workoutCopy.asDictionary())
    }
}
