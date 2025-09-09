//
//  SpecificWorkoutViewVIewModel.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-20.
//

import Foundation
import FirebaseAuth

class SpecificWorkoutViewViewModel: ObservableObject{
    @Published var showExerciseList = false
    @Published var userId = ""
    
    func getUId(){
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        userId = uId
    }

    
    
}
