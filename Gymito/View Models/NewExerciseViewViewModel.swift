//
//  NewExerciseViewViewModel.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation



class NewExerciseViewViewModel: ObservableObject {
    //@Published var title = ""
    @Published var numberOfSets = 3
    @Published var sets: [SetData] = Array(repeating: SetData(), count: 3)// Array to store data for each set
    @Published var isExpanded = false
    @Published var selectedOption = "choose an exercise"
    @Published  var selectedImage: String? = nil // Track the selected image
    @Published  var searchText = ""
    

    let options = workoutOptions
    /*
    let optionImages: [String: String] = [
        "Apple": "figure.strengthtraining.traditional",      // Use system images or your own asset names
        "Banana": "leaf.fill",
        "Orange": "circle.fill",  // Replace with appropriate image names
        "Mango": "star.fill",
        "Pineapple": "crown.fill",
        "Grapes": "drop.fill"]
     */
    
    var filteredOptions: [String] {
        if searchText.isEmpty {
            return options
        } else {
            return options.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }

    
    init(){
        
    }
    
    func adjustSets(to newValue: Int) {
            if newValue > sets.count {
                // Add new sets if the number of sets increases
                for _ in sets.count..<newValue {
                    sets.append(SetData())
                }
            } else if newValue < sets.count {
                // Remove excess sets if the number of sets decreases
                sets.removeLast(sets.count - newValue)
            }
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
        let viewModel = ProfileViewViewModel.shared
        viewModel.getUser()
        
        let newId = UUID().uuidString
        let newExercise = ExerciseListItem(
            id: newId,
            exercise: selectedOption,
            exerciseSets: sets)
        
        // Save the exercise only after ensuring user is loaded
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Wait briefly
            guard let user = viewModel.user else {
                print("User data not loaded yet")
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(uId)
                .collection("workouts")
                .document(user.workoutId)
                .collection("exercises")
                .document(newId)
                .setData(newExercise.asDictionary()) { error in
                    if let error = error {
                        print("Failed to save exercise: \(error)")
                    } else {
                        print("Exercise saved successfully")
                    }
                }
        }
}
        /*
        // Save Model
        let db = Firestore.firestore()
        
        if let user = viewModel.user {
            db.collection("users")
                .document(uId)
                .collection("workouts")
                .document(user.workoutId)
                .collection("exercises")
                .document(newId)
                .setData(newExercise.asDictionary())
        }
        
        */
    var canSave: Bool {
        guard selectedOption != "choose an exercise" else {
            return false
        }
        return true
    }
}
