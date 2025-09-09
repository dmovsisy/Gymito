//
//  SpecificExerciseViewViewModel.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation


class SpecificExerciseViewViewModel: ObservableObject{
    
    func toggleisCurrent(item: ExerciseListItem){
        let itemCopy = item
      //  itemCopy.setDone(!item.isCurrent)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("exercises")
            .document(itemCopy.id)
          .setData(itemCopy.asDictionary())
    }
}
