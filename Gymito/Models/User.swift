//
//  User.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let timeJoined: TimeInterval
    let workoutId: String
    let currentlyWorkingOut: Bool
    
}
