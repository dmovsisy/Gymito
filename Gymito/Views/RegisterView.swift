//
//  RegisterView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Register",
                       subtitle: "Start tracking today",
                       startlocation: .bottom,
                       endLocation: .top)
            .offset(y:-37)
            Form{
                TextField("full name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                ButtonView(title: "create account", startLocation: .leading, endLocation: .trailing){
                    //Attempt to make an account
                    viewModel.register()
                }
            }
            .offset(y:-150)
            Spacer()
            
        }
        
    }
    
}

#Preview {
    RegisterView()
}
