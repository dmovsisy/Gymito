//
//  WorkoutListViewView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-20.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct WorkoutListView: View {
    @StateObject var viewModel = WorkoutListViewViewModel()
    @FirestoreQuery var workouts: [Workout]
    
    
    //WANT TO MAKE A EXERCISES COLLECTION OFF OF WORKOUT COLLECTION, then add it up
    init(userId: String){
        self._workouts = FirestoreQuery(collectionPath: "users/\(userId)/workouts")
        // self._viewModel = StateObject(wrappedValue:
        //     WorkoutListViewViewModel(userId: userId)
        //     )
    }
    var body: some View {
        NavigationView {
            VStack {
                List(workouts) { workout in
                    SpecificWorkoutView(workout: workout)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("past workouts")
        }
    }
}

#Preview {
   // WorkoutListViewView()
}
