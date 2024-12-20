//
//  FinishWorkoutView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-19.
//

import SwiftUI

struct FinishWorkoutView: View {
    @StateObject var viewModel = FinishWorkoutViewViewModel()
    @State private var showWorkoutFinishSheet = false
    @Binding var FinishWorkoutPresented: Bool
    var body: some View {
            VStack {
                //title "final thoughts"
                Text("final thoughts")
                    .font(.system(size: 32))
                    .bold()
                    .padding(.top, 33)

                
                // Textfield
                TextField("optional notes, and final thoughts on the workout", text: $viewModel.finalthoughts, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(10, reservesSpace: true)
                    .multilineTextAlignment(.center)
                    .padding()
                

                Button{
                    //Action
                    viewModel.save()
                    FinishWorkoutPresented = false
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [Color.red.opacity(0.5), Color.red]),
                                startPoint: .leading,
                                endPoint: .trailing))
                        
                        
                        Text("workout complete")
                            .foregroundColor(Color.white)
                            .bold()
                        
                    }
                }
                .frame(height: 50)
                .padding()
            }
        }
    }
        // button to submit

#Preview {
   // FinishWorkoutView()
}
