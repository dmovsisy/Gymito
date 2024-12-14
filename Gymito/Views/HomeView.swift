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
            CalendarView()
                .tabItem{
                    Label("choose date", systemImage: "calendar")
                }
            ExerciseListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label(viewModel.getTodaysDate(), systemImage: "house")

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
