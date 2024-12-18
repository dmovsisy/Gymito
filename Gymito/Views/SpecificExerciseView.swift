//
//  SpecificExerciseView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import SwiftUI

struct SpecificExerciseView: View {
    @StateObject var viewModel = SpecificExerciseViewViewModel()
    let item: ExerciseListItem
    var body: some View {
        HStack{
            VStack{
                Text(item.exercise)
                    .bold()
                    .font(.system(size: 20))
                Spacer()
                ForEach(item.exerciseSets.indices, id: \.self) { index in
                    let set = item.exerciseSets[index]
                    Text("Set \(index + 1):  Weight: \(set.weight, specifier: "%.1f")  Reps: \(set.reps)")
                        .font(.body)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) 
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Button {
                // go to edit screen
            } label: {
                Image(systemName: "pencil")
                    .foregroundColor(.green)
            }
        }
    }
}

#Preview {
    //SpecificExerciseView()
}
