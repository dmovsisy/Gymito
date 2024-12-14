//
//  ProfileView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                ButtonView(title: "sign out", startLocation: .top, endLocation: .bottom){
                    viewModel.signOut();
                }
            }
            .navigationTitle("profile")
        }
        
    }
}

#Preview {
    ProfileView()
}
