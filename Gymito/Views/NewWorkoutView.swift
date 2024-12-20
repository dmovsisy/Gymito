//
//  NewWorkoutView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-19.
//

import SwiftUI

struct NewWorkoutView: View {
    @StateObject var viewModel = NewWorkoutViewViewModel()
    @State private var ShowExerciseView = false
    @Binding var NewWorkoutPresented: Bool
    var body: some View {
        NavigationStack {
            VStack {
                Text("start workout")
                    .font(.system(size: 32))
                    .bold()
                    .padding(.top, 33)
                
                Form {
                    // Title
                    TextField("workout title", text: $viewModel.title)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    // Date of workout
                    Text("date of workout")
                        .font(.headline)
                        .padding(.bottom, 5)
                    DatePicker("date of workout", selection: $viewModel.workoutDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    
                    ButtonView(title: "save", startLocation: .leading, endLocation: .trailing) {
                        //action
                        viewModel.save()
                        NewWorkoutPresented = false
                        ShowExerciseView = false
                    }
                    .padding()
                }
            }
        }
        .navigationDestination(isPresented: $ShowExerciseView) {
            ExerciseListView(userId: viewModel.userId!, workoutId: viewModel.workoutId)
        }
    }
}

#Preview {
   // NewWorkoutView()
}
