//
//  LoginView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "Welcome to Gymito",
                           subtitle: "Track your workouts",
                           startlocation: .top,
                           endLocation: .bottom)
                
                //Login Form
                Form {
                    if !viewModel.errormsg.isEmpty {
                        Text(viewModel.errormsg)
                            .foregroundColor(Color.red)
                    }
                    TextField("email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    
                    ButtonView(title: "login", startLocation: .trailing, endLocation: .leading){
                        //Attempt to login
                        viewModel.login()
                    }
                    
                    
                }
                .offset(y:-100)
                Spacer()
                //Create Account
                VStack{
                    Text("Don't have an account? Make one!")
                        
                    NavigationLink("Create Account", destination: RegisterView())
                    }
                }
                .padding(.bottom, 50)
                Spacer()
            
        }
    }
}

#Preview {
    LoginView()
}
