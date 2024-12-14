//
//  ProfileViewViewModel.swift
//  Gymito
//
//  Created by David Movsisyan  on 2024-12-10.
//

import FirebaseAuth
import Foundation

class ProfileViewViewModel: ObservableObject {
 
    func signOut(){
        
        //Try to log in
        try? Auth.auth().signOut()
        
        
    }
}
