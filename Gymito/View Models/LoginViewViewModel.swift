//
//  LoginViewViewModel.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errormsg = ""
    
    init() {}
    
    func login(){
        guard validate() else {
            return
        }
        
        //Try to log in
        Auth.auth().signIn(withEmail: email, password: password)
        
        
    }
    
    private func validate() -> Bool{
        errormsg = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errormsg = "please fill in all the fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errormsg = "please enter a valid email"
            return false
        }
        return true
    }
}
