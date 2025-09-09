//
//  ExerciseListViewViewModel.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-13.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ExerciseListViewViewModel: ObservableObject {
    @Published var showingNewExerciseView = false
    
    //Extend for workouts
    
    private let userId: String
    private let workoutId: String
    
    init(userId: String, workoutId: String){
        self.userId = userId
        self.workoutId = workoutId
    }
    
    // Delete exercise
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("exercises")
            .document(id)
            .delete()
        
    }
}

