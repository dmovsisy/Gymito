//
//  Workout.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-19.
//

import Foundation

struct Workout: Codable, Identifiable {
    let id: String
    let title: String
    let createdDate: TimeInterval
    let exercises: [ExerciseListItem]
    let finalNotes: String
    var isCurrent: Bool
    
    
    mutating func setDone(_ state: Bool){
        isCurrent = false
    }
}
