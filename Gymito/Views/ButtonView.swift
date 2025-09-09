//
//  ButtonView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-12.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let startLocation: UnitPoint
    let endLocation: UnitPoint
    let action: () -> Void
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.green.opacity(0.5), Color.green]),
                    startPoint: startLocation,
                    endPoint: endLocation))
                
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                
            }
        }
        .padding(10)
    }
}

#Preview {
    ButtonView(title: "login", startLocation: .trailing, endLocation: .leading){
        //Action
    }
}
