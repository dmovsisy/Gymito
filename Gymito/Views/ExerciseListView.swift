//
//  ExerciseListView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-13.
//

import FirebaseFirestore
import SwiftUI

struct ExerciseListView: View {
    @StateObject var viewModel: ExerciseListViewViewModel
    @FirestoreQuery var items: [ExerciseListItem]
    
    private let userId: String
    private let workoutId: String
    //WANT TO MAKE A EXERCISES COLLECTION OFF OF WORKOUT COLLECTION, then add it up
    init(userId: String, workoutId: String){
        self.userId = userId
        self.workoutId = workoutId
        
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/workouts/\(workoutId)/exercises")
        self._viewModel = StateObject(wrappedValue:
                                        ExerciseListViewViewModel(userId: userId, workoutId: workoutId)
        )
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                List(items) { item in
                    SpecificExerciseView(item: item)
                        .swipeActions{
                            Button (role: .destructive) {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("delete")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("exercise list")
            .toolbar {
                Button {
                    // New exercise for exercise list
                    viewModel.showingNewExerciseView = true
                } label: {
                    Image(systemName:  "plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            .sheet(isPresented: $viewModel.showingNewExerciseView){
                NewExerciseView(NewExercisePresented: $viewModel.showingNewExerciseView)
            }
        }
    }
}

#Preview {
    ExerciseListView(userId: "", workoutId: "")
}
