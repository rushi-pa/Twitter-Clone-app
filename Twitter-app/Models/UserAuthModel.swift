//
//  UserAuthModel.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-15.
//

import SwiftUI
import Firebase
class UserModel: ObservableObject {
    func login() {
    }
    func Register(email : String , password: String, userName: String, fullName: String, userProfile: UIImage){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Sign-up failed");
            }else{
                print("Sign-up Sucessful");
            }
        }
    }
    
}
