//
//  CalendarView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import SwiftUI
import FirebaseAuth

struct CalendarView: View {
    @StateObject var viewModel = CalendarViewViewModel()
    var body: some View {
        NavigationView {
            
            VStack {
                DatePicker("selected date", selection: $viewModel.selectedDate)
                    .datePickerStyle(.graphical)
                ButtonView(title: "select", startLocation: .leading, endLocation: .trailing) {
                    //action
                }
                .frame(height: 75)
                .navigationTitle("calendar")
                
            }
        }
    }
}

#Preview {
    CalendarView()
}
