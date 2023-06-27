//
//  LoginViewModel.swift
//  TODOList
//
//  Created by Rajesh Rajesh on 25/06/23.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    
    init() {}
    private func validate() -> Bool {
        error = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty  else {
            error = "Please fill in all fields" 
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            error = "Please enter valid email"
            return false
        }
        return true
    }
    
    func login() {
        guard validate() else {
            return
        }
        // try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
}
