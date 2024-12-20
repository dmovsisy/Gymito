//
//  SpecificWorkoutView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-20.
//

import SwiftUI

struct SpecificWorkoutView: View {
    @StateObject var viewModel = SpecificWorkoutViewViewModel()
    let workout: Workout
    var body: some View {
        HStack{
            Button{
                viewModel.getUId()
                viewModel.showExerciseList = true
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.green.opacity(0.5), Color.green]),
                        startPoint: .trailing,
                        endPoint: .leading))
                    
                    VStack{
                        Spacer()
                        Text(workout.title)
                            .foregroundColor(Color.white)
                            .bold()
                        Spacer()
                        Text("\(Date(timeIntervalSince1970: workout.createdDate).formatted(date: .abbreviated, time: .shortened))")
                            .font(.footnote)
                        Spacer()
                    }
                    
                }
            }
            .frame(height: 75)
            .frame(maxWidth: .infinity)
            .sheet(isPresented: $viewModel.showExerciseList) {
                ExerciseListView(userId: viewModel.userId, workoutId: workout.id)
                        }
        }
    }
}

#Preview {
 //   SpecificWorkoutView()
}
