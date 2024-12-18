//
//  NewExerciseDropdownView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-16.
//

import SwiftUI
/*
struct NewExerciseDropdownView: View {
    @State private var isExpanded = false
    @State private var selectedOption = "choose an exercise"
    @State private var selectedImage: String? = nil // Track the selected image
    @State private var searchText = ""
    let options = ["Apple", "Banana", "Orange", "Mango", "Pineapple", "Grapes"]
    
    let optionImages: [String: String] = [
        "Apple": "figure.strengthtraining.traditional",      // Use system images or your own asset names
        "Banana": "leaf.fill",
        "Orange": "circle.fill",  // Replace with appropriate image names
        "Mango": "star.fill",
        "Pineapple": "crown.fill",
        "Grapes": "drop.fill"]
    
    var filteredOptions: [String] {
        if searchText.isEmpty {
            return options
        } else {
            return options.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        VStack {
            Button(action: { isExpanded.toggle() }) {
                HStack {
                    if let imageName = selectedImage {
                        Image(systemName: imageName)
                            .foregroundColor(.green)
                    }
                    Text(selectedOption)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
            }
            
            if isExpanded {
                VStack {
                    TextField("search", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    ForEach(filteredOptions, id: \.self) { option in
                        HStack {
                            // Add an image corresponding to the option
                            if let imageName = optionImages[option] {
                                Image(systemName: imageName)
                                    .foregroundColor(.green) // Customize color if needed
                            }
                            Text(option)
                        }
                                    .padding()
                                .onTapGesture {
                                    selectedOption = option
                                    selectedImage = optionImages[option]
                                    isExpanded = false
                        }
                    }
                }
                .background(Color.black)
                .cornerRadius(8)
                .shadow(radius: 5)
            }
        }
        .padding()
    }
}

#Preview {
    NewExerciseDropdownView()
}
*/
