//
//  ExerciseListItem.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import Foundation

struct ExerciseListItem: Codable, Identifiable {
    let id: String
    let exercise: String
    let createdDate: TimeInterval
    let exerciseSets: [SetData]
    var isCurrent: Bool
    
    mutating func setdone(_ state: Bool){
        isCurrent = state
    }
}
