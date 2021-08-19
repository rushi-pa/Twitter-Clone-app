//
//  AuthViewModel.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-18.
//

import SwiftUI
import Firebase
class AuthViewModel: ObservableObject {
    func login() {
    }
    func Register(email : String , password: String, userName: String, fullName: String, userProfile: UIImage){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Sign-up failed\( error.localizedDescription)");
            }else{
                print("Sign-up Sucessful");
            }
        }
    }

}


