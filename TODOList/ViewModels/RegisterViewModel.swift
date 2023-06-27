//
//  RegisterViewModel.swift
//  TODOList
//
//  Created by Rajesh Rajesh on 25/06/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    
    init() {}
    private func validate() -> Bool {
        error = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,!email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty  else {
            error = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            error = "Please enter valid email"
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        return true
    }
    
    func register() {
        guard validate() else {
            return
        }
        // try log in
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.inserUserRecord(id: userId)
        }
    }
    
    func inserUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
}
