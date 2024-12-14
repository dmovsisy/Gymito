//
//  ExerciseListView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-13.
//

import SwiftUI

struct ExerciseListView: View {
    @StateObject var viewmodel = ExerciseListViewViewModel()
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    var body: some View {
        NavigationView {
            
            VStack {
                
            }
            .navigationTitle("exercise list")
            .toolbar {
                Button {
                    // New exercise for exercise list
                } label: {
                    Image(systemName:  "plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
        }
        
    }
}

#Preview {
    ExerciseListView(userId: "")
}
