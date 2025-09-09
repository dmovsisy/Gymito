//
//  ProfileView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    //Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.green)
                        .frame(width: 125, height: 125)
                    
                    // user Info
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Name: ")
                            Text(user.name)
                        }
                        .padding()
                        HStack{
                            Text("Email: ")
                            Text(user.email)
                        }
                        .padding()
                        HStack{
                            Text("Member Since: ")
                            Text("\(Date(timeIntervalSince1970: user.timeJoined).formatted(date: .abbreviated, time: .omitted))")
                        }
                        .padding()
                    }
                    Button{
                        viewModel.signOut()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [Color.red.opacity(0.5), Color.red]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                            
                            Text("signout")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                    .frame(height: 50)
                    .padding()
                    Spacer()
                } else {
                   Text("Loading Profile...")
                }
            }
            .navigationTitle("profile")
        }
        .onAppear{
            viewModel.getUser()
        }
    }
}

#Preview {
    ProfileView()
}
