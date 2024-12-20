//
//  NewExerciseView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import SwiftUI

struct NewExerciseView: View {
    @StateObject var viewModel = NewExerciseViewViewModel()
    @Binding var NewExercisePresented: Bool
    
    //Init numsets
    var body: some View {
        VStack {
            Text("add an exercise")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 33)
            
            Form {
                // Exercise Type, searchable drop down menu
                //NewExerciseDropdownView()
                VStack {
                    Button(action: { viewModel.isExpanded.toggle() }) {
                        HStack {
                            if let imageName = viewModel.selectedImage {
                                Image(systemName: imageName)
                                    .foregroundColor(.green)
                            }
                            Text(viewModel.selectedOption)
                            Spacer()
                            Image(systemName: viewModel.isExpanded ? "chevron.up" : "chevron.down")
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                    }
                    
                    if viewModel.isExpanded {
                        VStack {
                            TextField("search", text: $viewModel.searchText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            ForEach(viewModel.filteredOptions, id: \.self) { option in
                                HStack {
                                    // Add an image corresponding to the option
                                    if let imageName = viewModel.optionImages[option] {
                                        Image(systemName: imageName)
                                            .foregroundColor(.green) // Customize color if needed
                                    }
                                    Text(option)
                                }
                                            .padding()
                                        .onTapGesture {
                                            viewModel.selectedOption = option
                                            viewModel.selectedImage = viewModel.optionImages[option]
                                            viewModel.isExpanded = false
                                }
                            }
                        }
                        .background(Color.black)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                    }
                }
                .padding()
                
                // Number of sets
                HStack {
                    Stepper("number of sets:    \(viewModel.numberOfSets)", value: $viewModel.numberOfSets, in: 1...10, step: 1)
                        .onChange(of: viewModel.numberOfSets) { newValue in
                            viewModel.adjustSets(to: newValue)
                        }
                }
                .padding()
                
                // Weight and Reps
                
                ForEach(viewModel.sets.indices, id: \.self) { index in
                    HStack {
                        Text("set \(index + 1):")
                            .font(.headline)
                        Spacer()
                        Text("weight:")
                        TextField("", value: $viewModel.sets[index].weight, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.center)
                            .frame(width: 50)
                        Spacer()
                        Text("reps:")
                        TextField("", value: $viewModel.sets[index].reps, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.center)
                            .frame(width: 50)
                    }
                    
                    .padding()
                }
                
                // Button
                ButtonView(title: "save", startLocation: .trailing, endLocation: .leading) {
                    //action
                    viewModel.save()
                    NewExercisePresented = false
                }
            }
        }
    }
}

//#Preview {
//    NewExerciseView(NewExercisePresented: Binding(get: {
//        return true
//    }, set: { _ in
        
//    }))
//}
