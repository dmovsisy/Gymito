//
//  RegisterView.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Register",
                       subtitle: "Start tracking today",
                       startlocation: .bottom,
                       endLocation: .top)
            .offset(y:-37)
            Form{
                TextField("full name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("email", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                ButtonView(title: "create account", startLocation: .leading, endLocation: .trailing){
                    //Attempt to make an account
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
