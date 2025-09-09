//
//  ContentView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            StartWorkoutView()
                .tabItem {
                    Label("current workout", systemImage: "figure.strengthtraining.traditional")
                }
            WorkoutListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("past workouts", systemImage: "calendar")
                }
            ProfileView()
                .tabItem{
                    Label("profile", systemImage: "person.circle")
                }
        }
        .tint(.green)
    }
}

#Preview {
    HomeView()
}
