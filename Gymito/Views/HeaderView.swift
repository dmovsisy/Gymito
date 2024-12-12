//
//  HeaderView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let startlocation: UnitPoint
    let endLocation: UnitPoint
    
    var body: some View {
        ZStack{
            Capsule()
                .fill(LinearGradient(
                gradient: Gradient(colors: [Color.green.opacity(0.5), Color.green]),
                startPoint: startlocation,
                endPoint: endLocation
            ))
                .frame(width: UIScreen.main.bounds.width * 1.5, height: 400)
                .rotationEffect(Angle(degrees: 90))
                .offset(y: -300)
            
            VStack{
                Text(title)
                    .font(.system(size: 40))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                    .italic()
                    .padding(.bottom, 300)
            }
            
        }
    }
}

#Preview {
    HeaderView(title: "Welcome to Gymito", subtitle: "Track your workouts", startlocation: .leading, endLocation: .trailing)
}
