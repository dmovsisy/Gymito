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
    @Published var numberOfSets = 3 // abstact out
    @Published var sets: [SetData] = Array(repeating: SetData(), count: 3)// Array to store data for each set
    @Published var isExpanded = false
    @Published var selectedOption = "choose an exercise"
    @Published  var selectedImage: String? = nil // Track the selected image
    @Published  var searchText = ""
    let options = ["Apple", "Banana", "Orange", "Mango", "Pineapple", "Grapes"]
    
    let optionImages: [String: String] = [
        "Apple": "figure.strengthtraining.traditional",      // Use system images or your own asset names
        "Banana": "leaf.fill",
        "Orange": "circle.fill",  // Replace with appropriate image names
        "Mango": "star.fill",
        "Pineapple": "crown.fill",
        "Grapes": "drop.fill"]
    
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
        let newId = UUID().uuidString
        let newExercise = ExerciseListItem(
            id: newId,
            exercise: selectedOption,
            createdDate: Date().timeIntervalSince1970,
            exerciseSets: sets,
            isCurrent: true)
        
        // Save Model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("exercises")
            .document(newId)
            .setData(newExercise.asDictionary())
        
    }
    var canSave: Bool {
        guard selectedImage != "choose an exercise" else {
            return false
        }
        return true
    }
}
