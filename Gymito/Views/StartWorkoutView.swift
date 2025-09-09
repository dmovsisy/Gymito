//
//  WorkoutView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-19.
//

import SwiftUI


struct StartWorkoutView: View {
    @StateObject var viewModel = StartWorkoutViewViewModel()
    @StateObject var viewUserModel = ProfileViewViewModel()
 //   let workout: Workout
    var body: some View {
        NavigationView {
            if let user = viewUserModel.user {
                if user.currentlyWorkingOut == false {
                    VStack {
                        ButtonView(title: "start a workout", startLocation: .trailing, endLocation: .leading) {
                            viewModel.showWorkoutSheet = true
                        }
                        .frame(width: 250, height: 75)
                        
                        
                    }
                    .navigationTitle("workout")
                    .sheet(isPresented: $viewModel.showWorkoutSheet){
                        NewWorkoutView(NewWorkoutPresented: $viewModel.showWorkoutSheet)
                            .onDisappear{viewUserModel.getUser()}
                    }
                } else {
                    VStack{
                        ExerciseListView(userId: viewModel.userId!, workoutId: user.workoutId)
                        Button{
                            //Action
                            viewModel.showWorkoutFinishSheet = true
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(LinearGradient(
                                        gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.orange]),
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                
                                
                                Text("finish workout")
                                    .foregroundColor(Color.white)
                                    .bold()
                                
                            }
                            .frame(height: 50)
                        }
                        Spacer()
                    }
                    .sheet(isPresented: $viewModel.showWorkoutFinishSheet){
                        FinishWorkoutView(FinishWorkoutPresented: $viewModel.showWorkoutFinishSheet)
                            .onDisappear{viewUserModel.getUser()}
                    }
                }
            } else {
                Text("loading...")
            }
        }
        .onAppear{
            viewUserModel.getUser()
        }
    }
}

#Preview {
   // WorkoutView()
}
