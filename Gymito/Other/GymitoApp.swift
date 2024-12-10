//
//  GymitoApp.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import SwiftUI
import FirebaseCore

@main
struct GymitoApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
